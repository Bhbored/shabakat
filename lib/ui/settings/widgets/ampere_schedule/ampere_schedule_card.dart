import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/ampere_schedule_card_header.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/ampere_schedule_card_stats.dart';

class AmpereScheduleCard extends StatelessWidget {
  final AmpereSchedule schedule;

  const AmpereScheduleCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AmpereScheduleCardHeader(schedule: schedule),
            SizedBox(height: context.spaceMedium),
            AmpereScheduleCardStats(schedule: schedule),
          ],
        ),
      ),
    );
  }
}
