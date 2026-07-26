import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class AudioMessageBubble extends StatefulWidget {
  const AudioMessageBubble({
    super.key,
    required this.message,
    required this.isSentByMe,
  });

  final AudioMessage message;
  final bool isSentByMe;

  @override
  State<AudioMessageBubble> createState() => _AudioMessageBubbleState();
}

class _AudioMessageBubbleState extends State<AudioMessageBubble> {
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
