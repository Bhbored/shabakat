import 'package:easy_localization/easy_localization.dart';
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
          'invoices.bulk_create.description'.tr(),
          style: theme.textTheme.bodyMedium,
        ),
        SizedBox(height: context.spaceMedium),
        Text('invoices.bulk_create.billing_periods'.tr(), style: labelStyle),
        SizedBox(height: context.spaceSmall),
        _Bullet(
          icon: LucideIcons.zap,
          text: 'invoices.bulk_create.ampere_period'.tr(),
        ),
        SizedBox(height: context.spaceSmall * 0.5),
        _Bullet(
          icon: LucideIcons.gauge,
          text: 'invoices.bulk_create.kilowatt_period'.tr(),
        ),
        SizedBox(height: context.spaceMedium),
        Text('invoices.bulk_create.excluded'.tr(), style: labelStyle),
        SizedBox(height: context.spaceSmall),
        _Bullet(text: 'invoices.bulk_create.excluded_suspended'.tr()),
        SizedBox(height: context.spaceSmall * 0.5),
        _Bullet(text: 'invoices.bulk_create.excluded_terminated'.tr()),
        SizedBox(height: context.spaceSmall * 0.5),
        _Bullet(text: 'invoices.bulk_create.excluded_existing'.tr()),
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
