import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/ai/ai_service.dart';
import 'package:shabakat/core/utilities/temp_audio_store.dart';

part 'text_to_speech_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
TextToSpeechService textToSpeechService(Ref ref) {
  final service = TextToSpeechService(
    ref.read(aiServiceProvider),
    ref.read(tempAudioStoreProvider),
  );
  ref.onDispose(service.dispose);
  return service;
}

class TextToSpeechService {
  TextToSpeechService(this._aiService, this._audioStore) {
    _playerSub = _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        isSpeaking.value = false;
        speakingMessageId.value = null;
      }
    });
  }

  static final _markdownNoise = RegExp(
    r'(\*\*|__|`{1,3}|#{1,6}\s*|\[|\]|\(|\)|>\s*|!\[[^\]]*\]\([^)]*\))',
  );

  final AiService _aiService;
  final TempAudioStore _audioStore;
  final _player = AudioPlayer();
  final _logger = Logger();
  final _cache = <String, String>{};

  final isSpeaking = ValueNotifier<bool>(false);
  final speakingMessageId = ValueNotifier<String?>(null);

  StreamSubscription<PlayerState>? _playerSub;
  CancelToken? _cancelToken;

  String plainText(String markdown) {
    return markdown
        .replaceAll(_markdownNoise, '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  Future<void> speak({
    required String text,
    required String messageId,
  }) async {
    final spoken = plainText(text);
    if (spoken.isEmpty) return;

    if (isSpeaking.value && speakingMessageId.value == messageId) {
      await stop();
      return;
    }

    await stop();
    speakingMessageId.value = messageId;
    isSpeaking.value = true;

    try {
      var path = _cache[messageId];
      if (path != null) {
        final exists = await File(path).exists();
        if (!exists) {
          _cache.remove(messageId);
          path = null;
        }
      }
      if (path == null) {
        _cancelToken = CancelToken();
        final bytes = await _aiService.generateTts(
          spoken,
          cancelToken: _cancelToken,
        );
        path = await _audioStore.saveBytes(bytes);
        _cache[messageId] = path;
      }

      await _player.setFilePath(path);
      await _player.play();
    } catch (e, stackTrace) {
      final cancelled =
          e is DioException && CancelToken.isCancel(e);
      if (!cancelled) {
        _logger.e('TTS playback failed', error: e, stackTrace: stackTrace);
      }
      isSpeaking.value = false;
      speakingMessageId.value = null;
    } finally {
      _cancelToken = null;
    }
  }

  Future<void> stop() async {
    _cancelToken?.cancel();
    _cancelToken = null;
    try {
      await _player.stop();
    } catch (e, stackTrace) {
      _logger.w('TTS stop failed', error: e, stackTrace: stackTrace);
    } finally {
      isSpeaking.value = false;
      speakingMessageId.value = null;
    }
  }

  void dispose() {
    unawaited(stop());
    unawaited(_playerSub?.cancel() ?? Future<void>.value());
    unawaited(_player.dispose());
    isSpeaking.dispose();
    speakingMessageId.dispose();
  }
}
