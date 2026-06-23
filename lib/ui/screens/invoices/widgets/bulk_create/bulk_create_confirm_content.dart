import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class BulkCreateConfirmContent extends StatelessWidget {
  const BulkCreateConfirmContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final labelStyle = theme.textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: colorScheme.onSurface.withValues(alpha: 0.5),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Creates unpaid invoices for all active customers who do not yet '
          'have an invoice for their current billing period.',
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(height: context.spaceMedium),
        Text('BILLING PERIODS', style: labelStyle),
        SizedBox(height: context.spaceSmall),
        const _Bullet(
          icon: LucideIcons.zap,
          text: 'Ampere — current month (prepaid)',
        ),
        SizedBox(height: context.spaceSmall * 0.5),
        const _Bullet(
          icon: LucideIcons.gauge,
          text: 'Kilowatt — previous month (postpaid)',
        ),
        SizedBox(height: context.spaceMedium),
        Text('EXCLUDED AUTOMATICALLY', style: labelStyle),
        SizedBox(height: context.spaceSmall),
        const _Bullet(text: 'Suspended customers'),
        SizedBox(height: context.spaceSmall * 0.5),
        const _Bullet(text: 'Terminated customers'),
        SizedBox(height: context.spaceSmall * 0.5),
        const _Bullet(
          text: 'Customers who already have an invoice for their period',
        ),
      ],
    );
  }
}

class _Bullet extends StatelessWidget {
  final IconData? icon;
  final String text;

  const _Bullet({this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: 14,
            color: colorScheme.onSurface.withValues(alpha: 0.45),
          ),
          SizedBox(width: context.spaceSmall * 0.5),
        ] else ...[
          Padding(
            padding: EdgeInsets.only(top: context.spaceSmall * 0.35),
            child: Icon(
              Icons.circle,
              size: 5,
              color: colorScheme.onSurface.withValues(alpha: 0.45),
            ),
          ),
          SizedBox(width: context.spaceSmall),
        ],
        Expanded(child: Text(text, style: theme.textTheme.bodySmall)),
      ],
    );
  }
}
