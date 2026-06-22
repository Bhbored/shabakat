import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/expense/expense_pagination_provider.dart';

import 'expense_summary_tile.dart';

class ExpenseSummaryBar extends ConsumerWidget {
  const ExpenseSummaryBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagination = ref.watch(expensePaginationProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      child: Row(
        children: [
          Expanded(
            child: ExpenseSummaryTile(
              label: 'Entries',
              value: '${pagination.totalCount}',
              icon: LucideIcons.receipt,
            ),
          ),
          SizedBox(width: context.paddingSmall),
          Expanded(
            child: ExpenseSummaryTile(
              label: 'Total',
              value: pagination.totalAmount.toStringAsFixed(2),
              icon: LucideIcons.banknote,
              isAccent: true,
            ),
          ),
        ],
      ),
    );
  }
}
