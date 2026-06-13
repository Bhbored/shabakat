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
    if (value == null || value.trim().isEmpty) return 'Required';
    if (double.tryParse(value.trim()) == null) return 'Invalid number';
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
            Text('Pricing Override', style: theme.textTheme.titleMedium),
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
            label: 'Price Override',
            controller: priceOverrideController,
            hint: '0.00',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _validateOverride,
          ),
          SizedBox(height: context.spaceMedium),
          SubscriberEditFormField(
            label: 'Fixed Charge Override',
            controller: fixedChargeOverrideController,
            hint: '0.00',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _validateOverride,
          ),
          SizedBox(height: context.spaceMedium),
          SubscriberEditFormField(
            label: 'TVA Override',
            controller: tvaOverrideController,
            hint: '0.00',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: _validateOverride,
          ),
        ],
      ],
    );
  }
}
