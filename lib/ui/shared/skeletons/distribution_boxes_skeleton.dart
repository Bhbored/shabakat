import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/screens/distribution_box/widgets/distribution_box_card/distribution_box_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DistributionBoxesSkeleton extends StatelessWidget {
  const DistributionBoxesSkeleton({super.key});

  static const _itemCount = 6;

  static final _mockBoxes = List.generate(
    _itemCount,
    (index) => DistributionBox(
      id: 'skeleton-$index',
      name: 'Panel ${index + 1}',
      areaId: 'area-$index',
      areaName: 'Sample Area',
      locationNote: index.isEven ? 'Building entrance' : null,
      customerCount: 12 + index,
      createdAt: DateTime(2024, 3, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _DistributionBoxesToolbarSkeleton(),
            SizedBox(height: context.spaceSmall),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
                itemCount: _mockBoxes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: context.spaceSmall),
                    child: DistributionBoxCard(box: _mockBoxes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DistributionBoxesToolbarSkeleton extends StatelessWidget {
  const _DistributionBoxesToolbarSkeleton();

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
              'distribution_boxes.search.hint'.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            'distribution_boxes.box_count'.tr(args: ['6']),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
