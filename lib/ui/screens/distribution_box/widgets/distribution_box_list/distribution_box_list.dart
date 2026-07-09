import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';

import '../distribution_box_card/distribution_box_card.dart';

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
              'No distribution boxes found.',
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
          child: DistributionBoxCard(box: box),
        );
      },
    );
  }
}
