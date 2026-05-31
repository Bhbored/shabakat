import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import 'widgets/subscribers_toolbar/subscribers_toolbar.dart';
import 'widgets/subscriber_list/subscriber_list.dart';

class SubscribersScreen extends ConsumerStatefulWidget {
  const SubscribersScreen({super.key});

  @override
  ConsumerState<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends ConsumerState<SubscribersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _statusFilter = 'All';
  String _searchCriteria = 'name';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Customer> _filterCustomers(List<Customer> customers) {
    final q = _searchController.text.toLowerCase();
    return customers.where((s) {
      final matchSearch =
          s.name.toLowerCase().contains(q) ||
          (s.address?.toLowerCase().contains(q) ?? false) ||
          (s.phone?.contains(q) ?? false);
      bool statusMatch = true;
      if (_statusFilter != 'All') {
        statusMatch =
            s.customerStatus.name.toLowerCase() == _statusFilter.toLowerCase();
      }
      return matchSearch && statusMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customerProvider);
    final customers = customersAsync.asData?.value ?? [];
    final filtered = _filterCustomers(customers);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubscribersToolbar(
          searchController: _searchController,
          onSearchChanged: (value) => setState(() {}),
          currentFilter: _statusFilter,
          onFilterChanged: (filter) => setState(() => _statusFilter = filter),
          searchCriteria: _searchCriteria,
          onSearchCriteriaChanged: (criteria) =>
              setState(() => _searchCriteria = criteria),
          resultCount: filtered.length,
          totalCount: customers.length,
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
            data: (_) => SubscriberList(customers: filtered),
          ),
        ),
      ],
    );
  }
}
