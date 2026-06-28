import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_gradients.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class DynamicError extends StatelessWidget {
  final String text;
  final Future<void> Function() onTryAgain;

  const DynamicError({
    super.key,
    required this.text,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final innerRadius = context.borderRadiusLarge - 1.5;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.paddingLarge),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 340),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppGradients.errorBorderGradient,
              borderRadius: BorderRadius.circular(context.borderRadiusLarge),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.error.withValues(alpha: 0.14),
                  blurRadius: 28,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppGradients.cardGradientFor(theme.brightness),
                  borderRadius: BorderRadius.circular(innerRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(context.paddingLarge),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: ControlsThemes.statusBadgeDecoration(
                          colorScheme.error,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(context.paddingMedium),
                          child: Icon(
                            LucideIcons.alertCircle,
                            size: 28,
                            color: colorScheme.error,
                          ),
                        ),
                      ),
                      SizedBox(height: context.spaceMedium),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: context.spaceLarge),
                      ElevatedButton(
                        onPressed: () => onTryAgain(),
                        child: Text('errors.try_again'.tr()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
