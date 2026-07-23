import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:record/record.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/services/ai/ai_service.dart';
import 'package:shabakat/core/utilities/temp_audio_store.dart';
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
                return _MarkdownTextMessage(
                  message: message,
                  isSentByMe: isSentByMe,
                  isStreaming: _isStreaming &&
                      message.authorId == _assistantId &&
                      message.text.isEmpty,
                );
              },
          audioMessageBuilder:
              (context, message, index, {required isSentByMe, groupStatus}) {
                return _AudioMessageBubble(
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
                ? _RecordingBar(
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

class _RecordingBar extends StatelessWidget {
  const _RecordingBar({
    required this.durationLabel,
    required this.amplitude,
    required this.onCancel,
    required this.onSend,
  });

  final String durationLabel;
  final double amplitude;
  final VoidCallback onCancel;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        context.spaceSmall,
        context.paddingMedium,
        0,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.errorContainer.withValues(alpha: 0.45),
          borderRadius: BorderRadius.circular(context.borderRadiusLarge),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingSmall,
            vertical: context.spaceSmall,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: onCancel,
                tooltip: 'ai.delete'.tr(),
                icon: Icon(LucideIcons.trash2, color: colorScheme.error),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ai.recording'.tr(),
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.onErrorContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: context.spaceSmall / 2),
                    Row(
                      children: [
                        Text(
                          durationLabel,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onErrorContainer,
                          ),
                        ),
                        SizedBox(width: context.paddingSmall),
                        Expanded(
                          child: _Waveform(
                            level: amplitude,
                            color: colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton.filled(
                onPressed: onSend,
                tooltip: 'ai.send'.tr(),
                style: IconButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                icon: const Icon(LucideIcons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Waveform extends StatelessWidget {
  const _Waveform({
    required this.level,
    required this.color,
  });

  final double level;
  final Color color;

  static const _barCount = 20;

  @override
  Widget build(BuildContext context) {
    final normalized = ((level + 50) / 50).clamp(0.08, 1.0);

    return SizedBox(
      height: context.spaceMedium + context.spaceSmall,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_barCount, (index) {
          final wave = math.sin((index / _barCount) * math.pi);
          final height =
              (context.spaceSmall +
                      (normalized * context.spaceMedium * wave))
                  .clamp(context.spaceSmall / 2, context.spaceMedium * 1.4);
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingSmall / 8,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 90),
                curve: Curves.easeOut,
                height: height,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.35 + normalized * 0.55),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _AudioMessageBubble extends StatefulWidget {
  const _AudioMessageBubble({
    required this.message,
    required this.isSentByMe,
  });

  final AudioMessage message;
  final bool isSentByMe;

  @override
  State<_AudioMessageBubble> createState() => _AudioMessageBubbleState();
}

class _AudioMessageBubbleState extends State<_AudioMessageBubble> {
  late final AudioPlayer _player;
  StreamSubscription<PlayerState>? _playerSub;
  var _isPlaying = false;
  var _position = Duration.zero;
  var _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _duration = widget.message.duration;
    unawaited(_load());
    _playerSub = _player.playerStateStream.listen((state) {
      if (!mounted) return;
      setState(() => _isPlaying = state.playing);
      if (state.processingState == ProcessingState.completed) {
        unawaited(_player.seek(Duration.zero));
        unawaited(_player.pause());
      }
    });
    _player.positionStream.listen((position) {
      if (!mounted) return;
      setState(() => _position = position);
    });
    _player.durationStream.listen((duration) {
      if (!mounted || duration == null) return;
      setState(() => _duration = duration);
    });
  }

  Future<void> _load() async {
    try {
      await _player.setFilePath(widget.message.source);
    } catch (_) {}
  }

  @override
  void dispose() {
    _playerSub?.cancel();
    unawaited(_player.dispose());
    super.dispose();
  }

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  String _format(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final backgroundColor = widget.isSentByMe
        ? colorScheme.primary
        : colorScheme.surfaceContainerHighest;
    final foreground = widget.isSentByMe
        ? colorScheme.onPrimary
        : colorScheme.onSurface;
    final totalMs = _duration.inMilliseconds <= 0
        ? 1.0
        : _duration.inMilliseconds.toDouble();
    final progress = (_position.inMilliseconds / totalMs).clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.screenWidth * 0.72),
        decoration: BoxDecoration(color: backgroundColor),
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingSmall,
          vertical: context.paddingSmall,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: _togglePlay,
              tooltip: 'ai.audio'.tr(),
              icon: Icon(
                _isPlaying ? LucideIcons.pause : LucideIcons.play,
                color: foreground,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SliderTheme(
                    data: theme.sliderTheme.copyWith(
                      trackHeight: 3,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 12,
                      ),
                      activeTrackColor: foreground,
                      inactiveTrackColor: foreground.withValues(alpha: 0.3),
                      thumbColor: foreground,
                      overlayColor: foreground.withValues(alpha: 0.12),
                    ),
                    child: Slider(
                      value: progress,
                      onChanged: (value) {
                        final next = Duration(
                          milliseconds: (value * totalMs).round(),
                        );
                        unawaited(_player.seek(next));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.paddingSmall,
                    ),
                    child: Text(
                      '${_format(_position)} / ${_format(_duration)}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: foreground.withValues(alpha: 0.85),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MarkdownTextMessage extends StatelessWidget {
  const _MarkdownTextMessage({
    required this.message,
    required this.isSentByMe,
    required this.isStreaming,
  });

  final TextMessage message;
  final bool isSentByMe;
  final bool isStreaming;

  static final _rtlScript = RegExp(
    r'[\u0590-\u05FF\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF'
    r'\uFB50-\uFDFF\uFE70-\uFEFF]',
  );

  TextDirection _textDirection(BuildContext context) {
    final text = message.text.trim();
    if (text.isEmpty) return Directionality.of(context);
    return _rtlScript.hasMatch(text) ? TextDirection.rtl : TextDirection.ltr;
  }

  TextStyle? _withHeight(TextStyle? style, Color color) {
    return style?.copyWith(color: color, height: 1.4);
  }

  MarkdownStyleSheet _styleSheet(
    BuildContext context, {
    required Color foreground,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final base = _withHeight(theme.textTheme.bodyMedium, foreground);
    final sectionGap = EdgeInsets.only(bottom: context.spaceSmall);

    return MarkdownStyleSheet.fromTheme(theme).copyWith(
      blockSpacing: context.spaceSmall,
      p: base,
      pPadding: sectionGap,
      h1: _withHeight(theme.textTheme.titleLarge, foreground)?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      h1Padding: sectionGap,
      h2: _withHeight(theme.textTheme.titleMedium, foreground)?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      h2Padding: sectionGap,
      h3: _withHeight(theme.textTheme.titleSmall, foreground)?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      h3Padding: sectionGap,
      h4: _withHeight(theme.textTheme.bodyLarge, foreground)?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      h4Padding: sectionGap,
      h5: _withHeight(theme.textTheme.bodyMedium, foreground)?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      h5Padding: sectionGap,
      h6: _withHeight(theme.textTheme.bodyMedium, foreground),
      h6Padding: sectionGap,
      strong: base?.copyWith(fontWeight: FontWeight.bold),
      em: base?.copyWith(fontStyle: FontStyle.italic),
      del: base?.copyWith(decoration: TextDecoration.lineThrough),
      listBullet: base,
      listIndent: context.paddingMedium * 1.5,
      tableBody: base,
      tableHead: base?.copyWith(fontWeight: FontWeight.w600),
      tableColumnWidth: const IntrinsicColumnWidth(),
      tableCellsPadding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.spaceSmall / 2,
      ),
      tableBorder: TableBorder.all(
        color: foreground.withValues(alpha: 0.25),
      ),
      blockquote: base?.copyWith(
        color: foreground.withValues(alpha: 0.85),
      ),
      a: base?.copyWith(
        color: isSentByMe ? colorScheme.onPrimary : colorScheme.primary,
        decoration: TextDecoration.underline,
      ),
      code: theme.textTheme.bodySmall?.copyWith(
        fontFamily: 'monospace',
        color: foreground,
        height: 1.4,
        backgroundColor: colorScheme.surface.withValues(alpha: 0.28),
      ),
      codeblockDecoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      ),
      blockquoteDecoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium / 2),
        border: BorderDirectional(
          start: BorderSide(color: colorScheme.primary, width: 3),
        ),
      ),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: foreground.withValues(alpha: 0.25),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textDirection = _textDirection(context);
    final backgroundColor = isSentByMe
        ? colorScheme.primary
        : colorScheme.surfaceContainerHighest;
    final foreground = isSentByMe
        ? colorScheme.onPrimary
        : colorScheme.onSurface;

    return ClipRRect(
      borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.screenWidth * 0.82),
        decoration: BoxDecoration(color: backgroundColor),
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingMedium,
          vertical: context.paddingSmall,
        ),
        child: isStreaming
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foreground,
                ),
              )
            : Directionality(
                textDirection: textDirection,
                child: MarkdownBody(
                  data: message.text,
                  shrinkWrap: true,
                  fitContent: true,
                  styleSheet: _styleSheet(context, foreground: foreground),
                ),
              ),
      ),
    );
  }
}
