import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/area/area.dart';

import '../area_card/area_card.dart';

class AreaList extends StatelessWidget {
  final List<Area> areas;

  const AreaList({super.key, required this.areas});

  @override
  Widget build(BuildContext context) {
    if (areas.isEmpty) {
      final theme = Theme.of(context);
      return Center(
        child: Text(
          'areas.empty_list'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: areas.length,
      itemBuilder: (context, index) {
        final area = areas[index];
        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: AreaCard(area: area),
        );
      },
    );
  }
}
