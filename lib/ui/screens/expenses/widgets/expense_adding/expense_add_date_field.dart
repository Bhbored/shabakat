import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class ExpenseAddDateField extends StatelessWidget {
  final DateTime date;
  final String? errorText;
  final bool enabled;
  final VoidCallback onTap;

  const ExpenseAddDateField({
    super.key,
    required this.date,
    this.errorText,
    required this.enabled,
    required this.onTap,
  });

  String _formatDate(DateTime value) {
    final month = value.month.toString().padLeft(2, '0');
    final day = value.day.toString().padLeft(2, '0');
    return '$day/$month/${value.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('expenses.form.expense_date'.tr(), style: theme.textTheme.titleMedium),
        SizedBox(height: context.spaceSmall),
        InkWell(
          onTap: enabled ? onTap : null,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.paddingMedium,
              vertical: context.spaceMedium,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.borderRadiusMedium),
              border: Border.all(
                color: hasError ? colorScheme.error : colorScheme.outline,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _formatDate(date),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: hasError ? colorScheme.error : null,
                    ),
                  ),
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  color: colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (hasError) ...[
          SizedBox(height: context.spaceSmall),
          Text(
            errorText!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.error,
              fontSize: 13,
            ),
          ),
        ],
      ],
    );
  }
}
