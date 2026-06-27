import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';

import '../expense_card/expense_type_badge.dart';
import 'expense_detail_meta_tile.dart';
import 'expense_detail_section.dart';
import 'expense_detail_tile.dart';
import 'expense_details_header.dart';

class ExpenseDetailsBody extends StatelessWidget {
  final Expense expense;
  final Future<void> Function() onRefresh;

  const ExpenseDetailsBody({
    super.key,
    required this.expense,
    required this.onRefresh,
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
    final notes = expense.notes?.trim();
    final typeColor = ExpenseTypeBadge.colorFor(
      expense.expenseType,
      colorScheme,
    );
    final hasLabel = label != null && label.isNotEmpty;
    final hasNotes = notes != null && notes.isNotEmpty;

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpenseDetailsHeader(
              expense: expense,
              formattedDate: _formatDate(expense.expenseDate),
            ),
            Padding(
              padding: EdgeInsets.all(context.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasLabel)
                    ExpenseDetailSection(
                      title: 'expenses.details.details_section'.tr(),
                      children: [
                        ExpenseDetailTile(
                          icon: LucideIcons.tag,
                          label: 'expenses.details.label'.tr(),
                          value: label,
                          accentColor: typeColor,
                        ),
                      ],
                    ),
                  if (hasNotes) ...[
                    if (hasLabel) SizedBox(height: context.spaceMedium),
                    ExpenseDetailSection(
                      title: 'expenses.details.notes_section'.tr(),
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(context.paddingMedium),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest
                                .withValues(alpha: 0.45),
                            borderRadius: BorderRadius.circular(
                              context.borderRadiusMedium,
                            ),
                            border: Border.all(
                              color: colorScheme.outline.withValues(alpha: 0.35),
                            ),
                          ),
                          child: Text(
                            notes,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: context.spaceMedium),
                  Text(
                    'expenses.details.record'.tr(),
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: context.spaceSmall),
                  Row(
                    children: [
                      Expanded(
                        child: ExpenseDetailMetaTile(
                          label: 'expenses.details.created'.tr(),
                          value: _formatDate(expense.createdAt),
                          icon: LucideIcons.clock,
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Expanded(
                        child: ExpenseDetailMetaTile(
                          label: 'expenses.details.updated'.tr(),
                          value: _formatDate(expense.updatedAt),
                          icon: LucideIcons.refreshCw,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
