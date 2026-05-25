import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/core/themes/controls_themes.dart';
import 'package:shabakat/ui/data/app_data.dart';

class StatusBadge extends StatelessWidget {
  final SubscriberStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;
    IconData icon;

    switch (status) {
      case SubscriberStatus.paid:
        color = const Color(0xFF10B981); // Emerald
        label = 'Paid';
        icon = Icons.check_circle_outline;
        break;
      case SubscriberStatus.unpaid:
        color = AppColors.warning;
        label = 'Unpaid';
        icon = Icons.access_time;
        break;
      case SubscriberStatus.overdue:
        color = AppColors.error;
        label = 'Overdue';
        icon = Icons.error_outline;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.paddingSmall, vertical: context.paddingSmall * 0.25),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          SizedBox(width: context.paddingSmall * 0.5),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
