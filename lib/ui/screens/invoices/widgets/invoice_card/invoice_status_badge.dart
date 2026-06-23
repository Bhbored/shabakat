import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/invoice_status.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/core/themes/controls_themes.dart';

class InvoiceStatusBadge extends StatelessWidget {
  final InvoiceStatus status;

  const InvoiceStatusBadge({super.key, required this.status});

  static IconData iconFor(InvoiceStatus status) => switch (status) {
    InvoiceStatus.paid => LucideIcons.checkCircle2,
    InvoiceStatus.partiallypaid => LucideIcons.circleDot,
    InvoiceStatus.unpaid => LucideIcons.clock,
  };

  static Color colorFor(InvoiceStatus status, ColorScheme colorScheme) =>
      switch (status) {
        InvoiceStatus.paid => AppColors.success,
        InvoiceStatus.partiallypaid => AppColors.warning,
        InvoiceStatus.unpaid => colorScheme.onSurface.withValues(alpha: 0.55),
      };

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = colorFor(status, colorScheme);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.paddingSmall * 0.5,
      ),
      decoration: ControlsThemes.statusBadgeDecoration(color),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconFor(status), size: 12, color: color),
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
