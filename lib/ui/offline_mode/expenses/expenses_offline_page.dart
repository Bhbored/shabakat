import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/expense/expense_filter_provider.dart';
import 'package:shabakat/data/providers/expense/expense_pagination_provider.dart';
import 'package:shabakat/data/providers/expense/expense_provider.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_filter_chips/expense_filter_chips_row.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_list/expense_list.dart';
import 'package:shabakat/ui/screens/expenses/widgets/expense_summary_bar/expense_summary_bar.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/expenses_skeleton.dart';

class ExpensesOfflinePage extends ConsumerWidget {
  const ExpensesOfflinePage({super.key});

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

    return expensesAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const ExpensesSkeleton(),
      error: (err, _) => DynamicError(
        text: err is ApiException
            ? err.userMessage
            : 'expenses.load_failed'.tr(),
        onTryAgain: () => ref.read(expenseProvider.notifier).refresh(),
      ),
      data: (expenses) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: context.spaceSmall),
            child: const ExpenseSummaryBar(),
          ),
          const ExpenseFilterChipsRow(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(expenseFilterProvider.notifier).clearFilter();
                ref.invalidate(expenseProvider);
              },
              child: ExpenseList(expenses: expenses, readOnly: true),
            ),
          ),
          if (pagination.totalPages > 1)
            SubscribersPagination(
              currentPage: pagination.pageNumber,
              totalPages: pagination.totalPages,
              onPageChanged: goToPage,
              onFirstPage: filterNotifier.firstPage,
              onLastPage: filterNotifier.lastPage,
            ),
        ],
      ),
    );
  }
}
