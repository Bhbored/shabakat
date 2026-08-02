import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/screens/areas/widgets/area_card/area_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AreasSkeleton extends StatelessWidget {
  const AreasSkeleton({super.key});

  static const _itemCount = 6;

  static final _mockAreas = List.generate(
    _itemCount,
    (index) => Area(
      id: 'skeleton-$index',
      createdAt: DateTime(2024, 3, 1),
      updatedAt: DateTime(2024, 3, 1),
      companyId: 'company',
      name: 'Area Name',
      customerCount: 24,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _AreasToolbarSkeleton(),
            SizedBox(height: context.spaceSmall),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
                itemCount: _mockAreas.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: context.spaceSmall),
                    child: AreaCard(area: _mockAreas[index]),
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

class _AreasToolbarSkeleton extends StatelessWidget {
  const _AreasToolbarSkeleton();

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
            'areas.count_all'.tr(args: ['12']),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

