import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class BoxSelectField extends StatelessWidget {
  final String? boxName;
  final String? errorText;
  final VoidCallback onTap;
  final bool enabled;

  const BoxSelectField({
    super.key,
    required this.boxName,
    this.errorText,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasSelection = boxName != null && boxName!.isNotEmpty;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'subscribers.form.distribution_box'.tr(),
          style: theme.textTheme.titleMedium,
        ),
        SizedBox(height: context.spaceSmall),
        ListTile(
          onTap: enabled ? onTap : null,
          contentPadding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            side: BorderSide(
              color: hasError ? colorScheme.error : colorScheme.outline,
            ),
          ),
          title: Text(
            hasSelection
                ? boxName!
                : 'subscribers.form.distribution_box_hint'.tr(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: !enabled
                  ? colorScheme.onSurface.withValues(alpha: 0.38)
                  : hasSelection
                  ? null
                  : colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: colorScheme.onSurface.withValues(
              alpha: enabled ? 0.6 : 0.38,
            ),
          ),
        ),
      ],
    );
  }
}
