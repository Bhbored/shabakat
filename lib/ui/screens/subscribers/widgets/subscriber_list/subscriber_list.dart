import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/customer/customer_selection_provider.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import '../subscriber_card/subscriber_card.dart';

class SubscriberList extends ConsumerStatefulWidget {
  final List<Customer> customers;

  const SubscriberList({super.key, required this.customers});

  @override
  ConsumerState<SubscriberList> createState() => _SubscriberListState();
}

class _SubscriberListState extends ConsumerState<SubscriberList> {
  late final CustomerSelectionNotifier _selectionNotifier;

  @override
  void initState() {
    super.initState();
    _selectionNotifier = ref.read(customerSelectionProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectionNotifier.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final selection = ref.watch(customerSelectionProvider);

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: widget.customers.length,
      itemBuilder: (context, index) {
        final customer = widget.customers[index];
        final isSelected = selection.selectedCustomerIds.contains(customer.id);

        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: SubscriberCard(
            customer: customer,
            selectionMode: selection.isSelectionMode,
            isSelected: isSelected,
            onLongPress: () {
              final current = ref.read(customerSelectionProvider);
              final selectedIds = List<String>.from(
                current.selectedCustomerIds,
              );
              if (!selectedIds.contains(customer.id)) {
                selectedIds.add(customer.id);
              }
              _selectionNotifier.update(
                current.copyWith(
                  isSelectionMode: true,
                  selectedCustomerIds: selectedIds,
                ),
              );
            },
            onSelectionChanged: (selected) {
              final current = ref.read(customerSelectionProvider);
              final selectedIds = List<String>.from(
                current.selectedCustomerIds,
              );

              if (selected) {
                if (!selectedIds.contains(customer.id)) {
                  selectedIds.add(customer.id);
                }
              } else {
                selectedIds.remove(customer.id);
              }

              _selectionNotifier.update(
                current.copyWith(
                  isSelectionMode: selectedIds.isNotEmpty,
                  selectedCustomerIds: selectedIds,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
