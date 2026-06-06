import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../core/enums/enums.dart';
import '../../../core/themes/app_colors.dart';

abstract final class AppSnackBar {
  static SnackBar snackBar(
    BuildContext context, {
    required String message,
    required AppSnackBarVariant variant,
  }) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    late final Color background;
    late final Color foreground;
    late final IconData icon;

    switch (variant) {
      case AppSnackBarVariant.success:
        icon = Icons.check_circle_rounded;
        background = cs.primaryContainer;
        foreground = cs.onPrimaryContainer;
      case AppSnackBarVariant.error:
        icon = Icons.error_rounded;
        background = cs.errorContainer;
        foreground = cs.onErrorContainer;
      case AppSnackBarVariant.warning:
        icon = Icons.warning_rounded;
        background = isDark
            ? AppColors.warningContainerDark
            : AppColors.warningContainerLight;
        foreground = isDark
            ? AppColors.onWarningContainerDark
            : AppColors.onWarningContainerLight;
    }

    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: background,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.borderRadiusMedium)),
      margin: EdgeInsets.fromLTRB(
        context.paddingMedium,
        0,
        context.paddingMedium,
        context.bottomPadding + context.spaceSmall,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingMedium,
        vertical: context.spaceSmall,
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: foreground, size: 22),
          SizedBox(width: context.spaceSmall + 2),
          Expanded(
            child: Text(
              message,
              style: textTheme.bodyLarge?.copyWith(
                color: foreground,
                fontWeight: FontWeight.bold,
                height: 1.35,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            icon: Icon(Icons.close_rounded, color: foreground, size: 20),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  static void show(
    BuildContext context, {
    required String message,
    required AppSnackBarVariant variant,
    bool clearCurrent = true,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    if (clearCurrent) {
      messenger.clearSnackBars();
    }
    messenger.showSnackBar(
      snackBar(context, message: message, variant: variant),
    );
  }
}
