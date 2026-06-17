import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class CustomerStatusBadge extends StatelessWidget {
  final CustomerStatus status;

  const CustomerStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      CustomerStatus.active => AppColors.success,
      CustomerStatus.suspended => AppColors.warning,
      CustomerStatus.terminated => AppColors.error,
    };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.50,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            switch (status) {
              CustomerStatus.active => LucideIcons.checkCircle,
              CustomerStatus.suspended => LucideIcons.pauseCircle,
              CustomerStatus.terminated => LucideIcons.xCircle,
            },
            size: 12,
            color: color,
          ),
          SizedBox(width: context.paddingSmall * 0.5),
          Text(
            status.label,
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
