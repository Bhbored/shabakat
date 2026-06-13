import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';

import 'widgets/subscriber_list/subscriber_list.dart';
import 'widgets/subscribers_pagination/subscribers_pagination.dart';
import 'widgets/subscribers_toolbar/subscribers_toolbar.dart';

class SubscribersScreen extends ConsumerStatefulWidget {
  const SubscribersScreen({super.key});

  @override
  ConsumerState<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends ConsumerState<SubscribersScreen> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customerProvider);
    final filter = ref.watch(customerFilterProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubscribersToolbar(),
        SizedBox(height: context.spaceSmall),
        Expanded(
          child: customersAsync.when(
            skipLoadingOnRefresh: true,
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) {
              if (err is ApiException) {
                return Center(
                  child: Text(err.userMessage, textAlign: TextAlign.center),
                );
              }
              return Center(child: Text('Error loading customers: $err'));
            },
            data: (customers) => RefreshIndicator(
              onRefresh: () async {
                ref.read(customerFilterProvider.notifier).clearFilter();
                setState(() => _currentPage = 1);
                await ref.read(customerProvider.notifier).refresh();
              },
              child: SubscriberList(customers: customers),
            ),
          ),
        ),
        customersAsync.maybeWhen(
          data: (customers) {
            if (customers.length <= 10) return const SizedBox.shrink();

            final totalPages =
                (customers.length / filter.pageSize).ceil().clamp(1, 999);
            final currentPage = _currentPage.clamp(1, totalPages);

            return SubscribersPagination(
              currentPage: currentPage,
              totalPages: totalPages,
              pageSize: filter.pageSize,
              itemCount: customers.length,
              onPageChanged: (page) => setState(() => _currentPage = page),
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
