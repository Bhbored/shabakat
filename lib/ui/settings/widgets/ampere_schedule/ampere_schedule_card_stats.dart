import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/domain/entities/ampere_schedule/ampere_schedule.dart';
import 'package:shabakat/ui/settings/widgets/ampere_schedule/ampere_schedule_stat_item.dart';

class AmpereScheduleCardStats extends StatelessWidget {
  final AmpereSchedule schedule;

  const AmpereScheduleCardStats({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AmpereScheduleStatItem(
            icon: LucideIcons.clock,
            label: 'settings.ampere_schedule.hours_label'.tr(),
            value: '${schedule.hoursPerDay}',
          ),
        ),
        Expanded(
          child: AmpereScheduleStatItem(
            icon: LucideIcons.dollarSign,
            label: 'settings.ampere_schedule.price_label'.tr(),
            value: '${schedule.pricePerAmp}',
          ),
        ),
        Expanded(
          child: AmpereScheduleStatItem(
            icon: LucideIcons.users,
            label: 'settings.ampere_schedule.customers'.tr(),
            value: '${schedule.customerCount}',
          ),
        ),
      ],
    );
  }
}
