import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/expense_details_screen.dart';
import 'expense_type_badge.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final bool readOnly;

  const ExpenseCard({
    super.key,
    required this.expense,
    this.readOnly = false,
  });

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final label = expense.label?.trim();
    final hasLabel = label != null && label.isNotEmpty;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            openInnerScreen(
              widget: ExpenseDetailsScreen(
                expense: expense,
                readOnly: readOnly,
              ),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(context.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpenseTypeBadge(type: expense.expenseType),
                        if (hasLabel) ...[
                          SizedBox(height: context.spaceSmall),
                          Text(
                            label.toUpperCase(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(width: context.paddingSmall),
                  Text(
                    "\$${expense.amount.toStringAsFixed(2)}",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primary,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.spaceSmall),
              Row(
                children: [
                  Icon(
                    LucideIcons.calendar,
                    size: 14,
                    color: colorScheme.onSurface.withValues(alpha: 0.45),
                  ),
                  SizedBox(width: context.spaceSmall * 0.5),
                  Text(
                    _formatDate(expense.expenseDate),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.55),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
