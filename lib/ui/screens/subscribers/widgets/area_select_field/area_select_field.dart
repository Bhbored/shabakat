import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class AreaSelectField extends StatelessWidget {
  final String? areaName;
  final VoidCallback onTap;

  const AreaSelectField({
    super.key,
    required this.areaName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasSelection = areaName != null && areaName!.isNotEmpty;

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
            side: BorderSide(color: colorScheme.outline),
          ),
          title: Text(
            hasSelection ? areaName! : 'Select area',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: hasSelection
                  ? null
                  : colorScheme.onSurface.withValues(alpha: 0.5),
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
