import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/ai/widgets/recording/recording_waveform.dart';

class RecordingBar extends StatelessWidget {
  const RecordingBar({
    super.key,
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
                          child: RecordingWaveform(
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
