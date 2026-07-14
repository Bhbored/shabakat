import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_pagination_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_list/subscriber_list.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_toolbar/subscribers_toolbar.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/subscribers_skeleton.dart';

class CustomersOfflinePage extends ConsumerWidget {
  const CustomersOfflinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(customerProvider);
    final pagination = ref.watch(customerPaginationProvider);
    final filterNotifier = ref.read(customerFilterProvider.notifier);

    void goToPage(int page) {
      ref
          .read(customerFilterProvider.notifier)
          .updateFilter(
            ref.read(customerFilterProvider).copyWith(pageNumber: page),
          );
    }

    return customersAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const SubscribersSkeleton(),
      error: (err, _) => DynamicError(
        text: err is ApiException
            ? err.userMessage
            : 'subscribers.load_failed'.tr(),
        onTryAgain: () => ref.read(customerProvider.notifier).refresh(),
      ),
      data: (customers) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubscribersToolbar(readOnly: true),
          SizedBox(height: context.spaceSmall),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(customerFilterProvider.notifier).clearFilter();
                ref.invalidate(customerProvider);
              },
              child: SubscriberList(customers: customers, readOnly: true),
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
