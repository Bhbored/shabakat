import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';

class InvoicePayMethodField extends StatelessWidget {
  final PaymentMethod value;
  final bool enabled;
  final ValueChanged<PaymentMethod?> onChanged;

  const InvoicePayMethodField({
    super.key,
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment method', style: theme.textTheme.titleMedium),
        SizedBox(height: context.spaceSmall),
        Container(
          padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            border: Border.all(color: colorScheme.outline),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<PaymentMethod>(
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
              items: PaymentMethod.values.map((method) {
                return DropdownMenuItem<PaymentMethod>(
                  value: method,
                  child: Text(method.label),
                );
              }).toList(),
              onChanged: enabled ? onChanged : null,
            ),
          ),
        ),
      ],
    );
  }
}
