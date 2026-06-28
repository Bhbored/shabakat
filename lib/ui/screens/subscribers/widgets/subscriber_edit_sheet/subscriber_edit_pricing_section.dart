import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

import 'subscriber_edit_form_field.dart';

class SubscriberEditPricingSection extends StatelessWidget {
  final bool hasPricingOverride;
  final bool enabled;
  final TextEditingController priceOverrideController;
  final TextEditingController fixedChargeOverrideController;
  final TextEditingController tvaOverrideController;
  final ValueChanged<bool> onToggle;

  const SubscriberEditPricingSection({
    super.key,
    required this.hasPricingOverride,
    required this.enabled,
    required this.priceOverrideController,
    required this.fixedChargeOverrideController,
    required this.tvaOverrideController,
    required this.onToggle,
  });

  String? _validateOverride(String? value) {
    if (!hasPricingOverride) return null;
    if (value == null || value.trim().isEmpty) {
      return 'settings.validation.required'.tr();
    }
    if (double.tryParse(value.trim()) == null) {
      return 'subscribers.validation.invalid_number'.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('subscribers.form.pricing_override'.tr(), style: theme.textTheme.titleMedium),
            const Spacer(),
            Switch(
              value: hasPricingOverride,
              onChanged: enabled ? onToggle : null,
            ),
          ],
        ),
        if (hasPricingOverride) ...[
          SizedBox(height: context.spaceSmall),
          SubscriberEditFormField(
            label: 'subscribers.form.price_override'.tr(),
            controller: priceOverrideController,
            hint: 'subscribers.form.amount_hint'.tr(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _validateOverride,
          ),
          SizedBox(height: context.spaceMedium),
          SubscriberEditFormField(
            label: 'subscribers.form.fixed_charge_override'.tr(),
            controller: fixedChargeOverrideController,
            hint: 'subscribers.form.amount_hint'.tr(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _validateOverride,
          ),
          SizedBox(height: context.spaceMedium),
          SubscriberEditFormField(
            label: 'subscribers.form.tva_override'.tr(),
            controller: tvaOverrideController,
            hint: 'subscribers.form.amount_hint'.tr(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _validateOverride,
          ),
        ],
      ],
    );
  }
}
