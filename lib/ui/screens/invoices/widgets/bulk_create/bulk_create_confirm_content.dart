import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';

class BulkCreateConfirmContent extends StatelessWidget {
  final bool filterByPlan;
  final PlanType selectedPlan;
  final bool enabled;
  final ValueChanged<bool> onFilterToggled;
  final ValueChanged<PlanType> onPlanChanged;

  const BulkCreateConfirmContent({
    super.key,
    required this.filterByPlan,
    required this.selectedPlan,
    required this.enabled,
    required this.onFilterToggled,
    required this.onPlanChanged,
  });

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
        Row(
          children: [
            Expanded(
              child: Text(
                'invoices.bulk_create.plan_filter'.tr(),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Switch(
              value: filterByPlan,
              onChanged: enabled ? onFilterToggled : null,
            ),
          ],
        ),
        if (filterByPlan) ...[
          SizedBox(height: context.spaceSmall),
          _PlanDropdown(
            value: selectedPlan,
            enabled: enabled,
            onChanged: onPlanChanged,
          ),
        ],
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

class _PlanDropdown extends StatelessWidget {
  static const _options = [PlanType.ampere, PlanType.kilowatt];

  final PlanType value;
  final bool enabled;
  final ValueChanged<PlanType> onChanged;

  const _PlanDropdown({
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        border: Border.all(color: colorScheme.outline),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<PlanType>(
          padding: EdgeInsets.zero,
          isExpanded: true,
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          dropdownColor: colorScheme.surfaceContainerHigh,
          elevation: 4,
          alignment: AlignmentDirectional.centerStart,
          style: theme.textTheme.bodyMedium,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: colorScheme.onSurfaceVariant,
            size: 22,
          ),
          value: value,
          items: _options.map((plan) {
            return DropdownMenuItem<PlanType>(
              value: plan,
              child: Text(plan.label),
            );
          }).toList(),
          onChanged: enabled
              ? (plan) {
                  if (plan != null) onChanged(plan);
                }
              : null,
        ),
      ),
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
