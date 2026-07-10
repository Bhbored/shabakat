import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/distribution_box_details_screen.dart';
import 'distribution_box_card.dart';

class DistributionBoxList extends StatelessWidget {
  final List<DistributionBox> boxes;

  const DistributionBoxList({super.key, required this.boxes});

  @override
  Widget build(BuildContext context) {
    if (boxes.isEmpty) {
      final theme = Theme.of(context);
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: context.spaceLarge * 4),
          Center(
            child: Text(
              'distribution_boxes.empty_list'.tr(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: boxes.length,
      itemBuilder: (context, index) {
        final box = boxes[index];
        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: DistributionBoxCard(
            box: box,
            onTap: () {
              Navigator.of(context).push(
                openInnerScreen(
                  widget: DistributionBoxDetailsScreen(box: box),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
