import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class AreaSelectField extends StatelessWidget {
  final String? areaName;
  final String? errorText;
  final VoidCallback onTap;

  const AreaSelectField({
    super.key,
    required this.areaName,
    this.errorText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasSelection = areaName != null && areaName!.isNotEmpty;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Area', style: theme.textTheme.titleMedium),
        SizedBox(height: context.spaceSmall),
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            side: BorderSide(
              color: hasError ? colorScheme.error : colorScheme.outline,
            ),
          ),
          title: Text(
            hasError && !hasSelection
                ? errorText!
                : hasSelection
                ? areaName!
                : 'Select area',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: hasError
                  ? colorScheme.error
                  : hasSelection
                  ? null
                  : colorScheme.onSurface.withValues(alpha: 0.5),
              fontSize: hasError ? 13 : null,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
