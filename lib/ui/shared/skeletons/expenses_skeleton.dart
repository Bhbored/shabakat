import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/expense_type.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_card/expense_card.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_summary_bar/expense_summary_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExpensesSkeleton extends StatelessWidget {
  const ExpensesSkeleton({super.key});

  static const _itemCount = 6;

  static final _mockExpenses = List.generate(
    _itemCount,
    (index) => Expense(
      id: 'skeleton-$index',
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
      expenseType: ExpenseType.fuel,
      expenseDate: DateTime(2024, 6, 15),
      amount: 250,
      label: 'Fuel purchase',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: context.spaceSmall),
              child: const _ExpenseSummaryBarSkeleton(),
            ),
            const _ExpenseFilterChipsSkeleton(),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
                itemCount: _mockExpenses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: context.spaceSmall),
                    child: ExpenseCard(expense: _mockExpenses[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpenseSummaryBarSkeleton extends StatelessWidget {
  const _ExpenseSummaryBarSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      child: Row(
        children: [
          const Expanded(
            child: ExpenseSummaryTile(
              label: 'Entries',
              value: '48',
              icon: LucideIcons.receipt,
            ),
          ),
          SizedBox(width: context.paddingSmall),
          const Expanded(
            child: ExpenseSummaryTile(
              label: 'Total',
              value: '3200.00',
              icon: LucideIcons.banknote,
              isAccent: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpenseFilterChipsSkeleton extends StatelessWidget {
  const _ExpenseFilterChipsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        0,
        context.paddingSmall,
        context.spaceSmall,
      ),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            icon: const Icon(LucideIcons.slidersHorizontal),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
