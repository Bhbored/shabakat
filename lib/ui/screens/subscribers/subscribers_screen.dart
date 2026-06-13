import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';

import 'widgets/subscribers_toolbar/subscribers_toolbar.dart';
import 'widgets/subscriber_list/subscriber_list.dart';

class SubscribersScreen extends ConsumerWidget {
  const SubscribersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(customerProvider);

    return RefreshIndicator(
      onRefresh: () => ref.read(customerProvider.notifier).refresh(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubscribersToolbar(),
          SizedBox(height: context.spaceSmall),
          Expanded(
            child: customersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) {
                if (err is ApiException) {
                  return Center(
                    child: Text(err.userMessage, textAlign: TextAlign.center),
                  );
                }
                return Center(child: Text('Error loading customers: $err'));
              },
              data: (customers) => SubscriberList(customers: customers),
            ),
          ),
        ],
      ),
    );
  }
}
