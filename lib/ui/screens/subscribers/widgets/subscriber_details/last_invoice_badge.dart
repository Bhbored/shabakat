import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class LastInvoiceBadge extends StatelessWidget {
  final bool paidThisMonth;

  const LastInvoiceBadge({super.key, required this.paidThisMonth});

  @override
  Widget build(BuildContext context) {
    final color = paidThisMonth ? AppColors.success : AppColors.error;
    final icon = paidThisMonth ? LucideIcons.check : LucideIcons.x;
    final label = 'Last invoice';

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.50,
      ),
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
