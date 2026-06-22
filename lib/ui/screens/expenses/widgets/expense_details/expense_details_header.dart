import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';

import '../expense_card/expense_type_badge.dart';

class ExpenseDetailsHeader extends StatelessWidget {
  final Expense expense;
  final String formattedDate;

  const ExpenseDetailsHeader({
    super.key,
    required this.expense,
    required this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final label = expense.label?.trim();
    final hasLabel = label != null && label.isNotEmpty;
    final typeColor = ExpenseTypeBadge.colorFor(
      expense.expenseType,
      colorScheme,
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [typeColor.withValues(alpha: 0.18), colorScheme.surface],
        ),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.25),
          ),
        ),
      ),
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ExpenseTypeBadge(type: expense.expenseType),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(context.paddingSmall),
                decoration: BoxDecoration(
                  color: typeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                ),
                child: Icon(
                  ExpenseTypeBadge.iconFor(expense.expenseType),
                  size: 20,
                  color: typeColor,
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceMedium),
          Text(
            "\$${expense.amount.toStringAsFixed(2)}",
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: 'JetBrains Mono',
              color: colorScheme.primary,
              height: 1,
            ),
          ),
          if (hasLabel) ...[
            SizedBox(height: context.spaceSmall),
            Text(
              label.toUpperCase(),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4,
              ),
            ),
          ],
          SizedBox(height: context.spaceSmall),
          Row(
            children: [
              Icon(
                LucideIcons.calendar,
                size: 15,
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              SizedBox(width: context.paddingSmall * 0.5),
              Text(
                formattedDate,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.65),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
