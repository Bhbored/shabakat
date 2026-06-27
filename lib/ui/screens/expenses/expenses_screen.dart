import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/expense/expense_filter_provider.dart';
import 'package:shabakat/data/providers/expense/expense_pagination_provider.dart';
import 'package:shabakat/data/providers/expense/expense_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';

import 'widgets/expense_filter_chips/expense_filter_chips_row.dart';
import 'widgets/expense_list/expense_list.dart';
import 'widgets/expense_summary_bar/expense_summary_bar.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expenseProvider);
    final pagination = ref.watch(expensePaginationProvider);
    final filterNotifier = ref.read(expenseFilterProvider.notifier);

    void goToPage(int page) {
      ref
          .read(expenseFilterProvider.notifier)
          .updateFilter(
            ref.read(expenseFilterProvider).copyWith(pageNumber: page),
          );
    }

    return _ExpensesLayout(
      body: expensesAsync.when(
        skipLoadingOnRefresh: true,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) {
          final message = err is ApiException
              ? err.userMessage
              : 'expenses.load_failed'.tr();
          return Center(child: Text(message, textAlign: TextAlign.center));
        },
        data: (expenses) => RefreshIndicator(
          onRefresh: () async {
            ref.read(expenseFilterProvider.notifier).clearFilter();
            await ref.read(expenseProvider.notifier).refresh();
          },
          child: ExpenseList(expenses: expenses),
        ),
      ),
      pagination: pagination.totalPages > 1
          ? SubscribersPagination(
              currentPage: pagination.pageNumber,
              totalPages: pagination.totalPages,
              onPageChanged: goToPage,
              onFirstPage: filterNotifier.firstPage,
              onLastPage: filterNotifier.lastPage,
            )
          : null,
    );
  }
}

class _ExpensesLayout extends StatelessWidget {
  final Widget body;
  final Widget? pagination;

  const _ExpensesLayout({required this.body, this.pagination});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: const ExpenseSummaryBar(),
        ),
        const ExpenseFilterChipsRow(),
        Expanded(child: body),
        ?pagination,
      ],
    );
  }
}
