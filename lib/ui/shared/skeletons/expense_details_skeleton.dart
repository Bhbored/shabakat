import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/expense_type.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_card/expense_type_badge.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_details/expense_detail_meta_tile.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_details/expense_detail_section.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_details/expense_detail_tile.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_details/expense_details_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExpenseDetailsSkeleton extends StatelessWidget {
  const ExpenseDetailsSkeleton({super.key});

  static final _mockExpense = Expense(
    id: 'skeleton',
    createdAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 6, 15),
    expenseType: ExpenseType.fuel,
    expenseDate: DateTime(2024, 6, 15),
    amount: 250,
    label: 'Fuel purchase',
    notes: 'Sample expense notes for skeleton loading state.',
  );

  static String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final typeColor = ExpenseTypeBadge.colorFor(
      _mockExpense.expenseType,
      colorScheme,
    );

    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpenseDetailsHeader(
                expense: _mockExpense,
                formattedDate: _formatDate(_mockExpense.expenseDate),
              ),
              Padding(
                padding: EdgeInsets.all(context.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpenseDetailSection(
                      title: 'expenses.details.details_section'.tr(),
                      children: [
                        ExpenseDetailTile(
                          icon: LucideIcons.tag,
                          label: 'expenses.details.label'.tr(),
                          value: _mockExpense.label!,
                          accentColor: typeColor,
                        ),
                      ],
                    ),
                    SizedBox(height: context.spaceMedium),
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
                            _mockExpense.notes!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                            value: _formatDate(_mockExpense.createdAt),
                            icon: LucideIcons.clock,
                          ),
                        ),
                        SizedBox(width: context.paddingSmall),
                        Expanded(
                          child: ExpenseDetailMetaTile(
                            label: 'expenses.details.updated'.tr(),
                            value: _formatDate(_mockExpense.updatedAt),
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
      ),
    );
  }
}
