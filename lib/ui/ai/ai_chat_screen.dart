import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:record/record.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/services/ai/ai_service.dart';
import 'package:shabakat/core/utilities/temp_audio_store.dart';
import 'package:shabakat/ui/ai/widgets/markdown_convertion/markdown_text_message.dart';
import 'package:shabakat/ui/ai/widgets/recording/audio_message_bubble.dart';
import 'package:shabakat/ui/ai/widgets/recording/recording_bar.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';
import 'package:uuid/uuid.dart';

class AiChatScreen extends ConsumerStatefulWidget {
  const AiChatScreen({super.key});

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  static const _userId = 'user';
  static const _assistantId = 'assistant';

  final _chatController = InMemoryChatController();
  final _uuid = const Uuid();
  final _recorder = AudioRecorder();

  late final TempAudioStore _audioStore;
  CancelToken? _cancelToken;
  StreamSubscription<Amplitude>? _amplitudeSub;
  Timer? _durationTimer;

  var _isStreaming = false;
  var _isRecording = false;
  String? _recordingPath;
  Duration _recordingDuration = Duration.zero;
  double _amplitude = 0;

  @override
  void initState() {
    super.initState();
    _audioStore = ref.read(tempAudioStoreProvider);
    unawaited(_audioStore.clear());
  }

  @override
  void dispose() {
    _cancelToken?.cancel();
    _durationTimer?.cancel();
    _amplitudeSub?.cancel();
    unawaited(_recorder.dispose());
    unawaited(_audioStore.clear());
    _chatController.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (_isStreaming) return;
    if (_isRecording) {
      await _cancelRecording();
      return;
    }

    final permitted = await _recorder.hasPermission();
    if (!permitted) {
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'ai.mic_denied'.tr(),
        variant: AppSnackBarVariant.error,
      );
      return;
    }

    final path = await _audioStore.newRecordingPath();
    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: path,
    );

    await _amplitudeSub?.cancel();
    _amplitudeSub = _recorder
        .onAmplitudeChanged(const Duration(milliseconds: 80))
        .listen((amp) {
          if (!mounted) return;
          setState(() => _amplitude = amp.current);
        });

    _durationTimer?.cancel();
    _durationTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        _recordingDuration += const Duration(seconds: 1);
      });
    });

    setState(() {
      _isRecording = true;
      _recordingPath = path;
      _recordingDuration = Duration.zero;
      _amplitude = 0;
    });
  }

  Future<void> _cancelRecording() async {
    await _recorder.cancel();
    await _amplitudeSub?.cancel();
    _amplitudeSub = null;
    _durationTimer?.cancel();
    _durationTimer = null;

    final path = _recordingPath;
    if (path != null) {
      try {
        final file = File(path);
        if (await file.exists()) await file.delete();
      } catch (_) {}
    }

    if (!mounted) return;
    setState(() {
      _isRecording = false;
      _recordingPath = null;
      _recordingDuration = Duration.zero;
      _amplitude = 0;
    });
  }

  Future<void> _sendRecording() async {
    if (!_isRecording) return;

    final path = await _recorder.stop();
    await _amplitudeSub?.cancel();
    _amplitudeSub = null;
    _durationTimer?.cancel();
    _durationTimer = null;

    final duration = _recordingDuration;
    setState(() {
      _isRecording = false;
      _recordingPath = null;
      _recordingDuration = Duration.zero;
      _amplitude = 0;
    });

    if (path == null || path.isEmpty) return;
    await _onAudioSend(path, duration);
  }

  Future<void> _onMessageSend(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _isStreaming || _isRecording) return;

    await _chatController.insertMessage(
      TextMessage(
        id: _uuid.v4(),
        authorId: _userId,
        createdAt: DateTime.now().toUtc(),
        text: trimmed,
      ),
    );
    await _streamReply(prompt: trimmed);
  }

  Future<void> _onAudioSend(String path, Duration duration) async {
    if (_isStreaming) return;

    await _audioStore.track(path);
    final size = await File(path).length();

    await _chatController.insertMessage(
      AudioMessage(
        id: _uuid.v4(),
        authorId: _userId,
        createdAt: DateTime.now().toUtc(),
        source: path,
        duration: duration < const Duration(seconds: 1)
            ? const Duration(seconds: 1)
            : duration,
        size: size,
      ),
    );
    await _streamReply(audioFilePath: path);
  }

  Future<void> _streamReply({
    String? prompt,
    String? audioFilePath,
  }) async {
    setState(() => _isStreaming = true);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    var assistantMessage = TextMessage(
      id: _uuid.v4(),
      authorId: _assistantId,
      createdAt: DateTime.now().toUtc(),
      text: '',
    );
    await _chatController.insertMessage(assistantMessage);

    var accumulated = '';
    try {
      await for (final chunk in ref.read(aiServiceProvider).streamChat(
        prompt: prompt,
        audioFilePath: audioFilePath,
        cancelToken: _cancelToken,
      )) {
        if (!mounted) return;
        accumulated += chunk;
        final updated = assistantMessage.copyWith(text: accumulated);
        await _chatController.updateMessage(assistantMessage, updated);
        assistantMessage = updated;
      }
    } catch (e) {
      if (!mounted) return;
      final cancelled =
          (e is DioException && CancelToken.isCancel(e)) ||
          (e is ApiException &&
              e.originalError is DioException &&
              CancelToken.isCancel(e.originalError as DioException));
      if (!cancelled) {
        AppSnackBar.show(
          context,
          message: e is ApiException ? e.userMessage : 'ai.error'.tr(),
          variant: AppSnackBarVariant.error,
        );
      }
    } finally {
      _cancelToken = null;
      if (mounted) setState(() => _isStreaming = false);
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ai.title'.tr(),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSecondary,
          ),
        ),
      ),
      body: Chat(
        chatController: _chatController,
        currentUserId: _userId,
        theme: ChatTheme.fromThemeData(theme),
        onMessageSend: (_isStreaming || _isRecording) ? null : _onMessageSend,
        onAttachmentTap: _isStreaming ? null : _toggleRecording,
        resolveUser: (id) async {
          if (id == _assistantId) {
            return User(id: id, name: 'ai.assistant_name'.tr());
          }
          return User(id: id, name: 'ai.you'.tr());
        },
        builders: Builders(
          textMessageBuilder:
              (context, message, index, {required isSentByMe, groupStatus}) {
                return MarkdownTextMessage(
                  message: message,
                  isSentByMe: isSentByMe,
                  isStreaming: _isStreaming &&
                      message.authorId == _assistantId &&
                      message.text.isEmpty,
                );
              },
          audioMessageBuilder:
              (context, message, index, {required isSentByMe, groupStatus}) {
                return AudioMessageBubble(
                  message: message,
                  isSentByMe: isSentByMe,
                );
              },
          composerBuilder: (context) => Composer(
            hintText: 'ai.hint'.tr(),
            sendButtonDisabled: _isStreaming || _isRecording,
            attachmentIcon: Icon(
              _isRecording ? LucideIcons.micOff : LucideIcons.mic,
            ),
            attachmentIconColor: _isRecording
                ? colorScheme.error
                : colorScheme.onSurface.withValues(alpha: 0.55),
            topWidget: _isRecording
                ? RecordingBar(
                    durationLabel: _formatDuration(_recordingDuration),
                    amplitude: _amplitude,
                    onCancel: _cancelRecording,
                    onSend: _sendRecording,
                  )
                : null,
            sendIcon: _isStreaming
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.primary,
                    ),
                  )
                : const Icon(Icons.send),
          ),
          emptyChatListBuilder: (context) => Center(
            child: Padding(
              padding: EdgeInsets.all(context.paddingLarge),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LucideIcons.bot,
                    size: 48,
                    color: colorScheme.onSurface.withValues(alpha: 0.35),
                  ),
                  SizedBox(height: context.spaceMedium),
                  Text(
                    'ai.empty'.tr(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
