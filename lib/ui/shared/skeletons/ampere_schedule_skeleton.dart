import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/ampere_schedule_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AmpereScheduleSkeleton extends StatelessWidget {
  const AmpereScheduleSkeleton({super.key});

  static const _itemCount = 5;

  static final _mockSchedules = List.generate(
    _itemCount,
    (index) => AmpereSchedule(
      id: 'skeleton-$index',
      name: 'Schedule Name',
      hoursPerDay: 12,
      pricePerAmp: 1500,
      customerCount: 24,
      createdAt: DateTime(2024, 3, 1),
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
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(context.paddingMedium),
          itemCount: _mockSchedules.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: context.spaceSmall),
              child: AmpereScheduleCard(schedule: _mockSchedules[index]),
            );
          },
        ),
      ),
    );
  }
}
