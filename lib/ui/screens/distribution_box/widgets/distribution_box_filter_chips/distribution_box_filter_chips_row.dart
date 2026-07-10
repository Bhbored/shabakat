import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/distribution_box_search_screen.dart';

class DistributionBoxFilterChipsRow extends ConsumerWidget {
  const DistributionBoxFilterChipsRow({super.key});

  String? _areaNameForId(List<Area>? areas, String? areaId) {
    if (areaId == null || areas == null) return null;
    for (final area in areas) {
      if (area.id == areaId) return area.name;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(distributionBoxFilterProvider);
    final areas = ref.watch(areaProvider).asData?.value;
    final areaName = _areaNameForId(areas, filter.areaId);
    final chips = <Widget>[];

    if (filter.name != null && filter.name!.trim().isNotEmpty) {
      chips.add(
        _FilterChip(
          label: 'distribution_boxes.search.filter_name'.tr(
            args: [filter.name!.trim()],
          ),
        ),
      );
    }
    if (areaName != null) {
      chips.add(
        _FilterChip(
          label: 'distribution_boxes.search.filter_area'.tr(args: [areaName]),
        ),
      );
    }

    if (chips.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        0,
        context.paddingSmall,
        context.spaceSmall,
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < chips.length; i++) ...[
                    if (i > 0) SizedBox(width: context.paddingSmall),
                    chips[i],
                  ],
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              Navigator.of(context).push(
                openInnerScreen(
                  widget: const DistributionBoxSearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.5,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
