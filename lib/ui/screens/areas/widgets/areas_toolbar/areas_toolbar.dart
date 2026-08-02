import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/areas_search_screen.dart';

class AreasToolbar extends StatelessWidget {
  final int totalCount;
  final bool readOnly;

  const AreasToolbar({
    super.key,
    required this.totalCount,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final inputTheme = theme.inputDecorationTheme;
    final enabledBorder = inputTheme.enabledBorder;
    final borderRadius = enabledBorder is OutlineInputBorder
        ? enabledBorder.borderRadius
        : BorderRadius.circular(context.borderRadiusMedium);
    final borderSide = enabledBorder is OutlineInputBorder
        ? enabledBorder.borderSide
        : BorderSide(color: colorScheme.outline);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                openInnerScreen(
                  widget: AreasSearchScreen(readOnly: readOnly),
                ),
              );
            },
            dense: true,
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.symmetric(
              horizontal: context.paddingSmall,
            ),
            minLeadingWidth: 28,
            tileColor: inputTheme.fillColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
              side: borderSide,
            ),
            leading: Icon(
              Icons.search,
              size: 20,
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            title: Text(
              'areas.search_hint'.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            'areas.count_all'.tr(args: [totalCount.toString()]),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
