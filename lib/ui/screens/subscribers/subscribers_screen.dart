import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';

import 'widgets/subscribers_toolbar/subscribers_toolbar.dart';
import 'widgets/subscriber_list/subscriber_list.dart';

class SubscribersScreen extends ConsumerStatefulWidget {
  const SubscribersScreen({super.key});

  @override
  ConsumerState<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends ConsumerState<SubscribersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchCriteria = 'name';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applySearch() {
    ref.read(customerFilterProvider.notifier).updateSearch(
          criteria: _searchCriteria,
          query: _searchController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubscribersToolbar(
          searchController: _searchController,
          onSearchChanged: (_) => _applySearch(),
          searchCriteria: _searchCriteria,
          onSearchCriteriaChanged: (criteria) {
            setState(() => _searchCriteria = criteria);
            _applySearch();
          },
        ),
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
    );
  }
}
