import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/distribution_box_filter_request.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/distribution_box_search_screen.dart';

class DistributionBoxToolbar extends ConsumerWidget {
  final int totalCount;

  const DistributionBoxToolbar({super.key, required this.totalCount});

  String? _activeQuery(DistributionBoxFilterRequest filter, List<Area>? areas) {
    if (filter.name != null) return filter.name;
    if (filter.areaId != null) {
      for (final area in areas ?? const <Area>[]) {
        if (area.id == filter.areaId) return area.name;
      }
      return filter.areaId;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(distributionBoxFilterProvider);
    final areas = ref.watch(areaProvider).asData?.value;
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
    final activeQuery = _activeQuery(filter, areas);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                openInnerScreen(
                  widget: const DistributionBoxSearchScreen(),
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
              activeQuery ?? 'distribution_boxes.search.hint'.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: activeQuery != null
                    ? null
                    : colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            totalCount == 1
                ? 'distribution_boxes.box_count_one'.tr()
                : 'distribution_boxes.box_count'.tr(
                    args: [totalCount.toString()],
                  ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
