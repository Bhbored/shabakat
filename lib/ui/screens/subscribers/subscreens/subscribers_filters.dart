import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/customer_status.dart';
import 'package:shabakat/core/enums/customer_type.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';

import '../widgets/filter_section/filter_section.dart';

class SubscribersFilters extends ConsumerStatefulWidget {
  const SubscribersFilters({super.key});

  @override
  ConsumerState<SubscribersFilters> createState() => _SubscribersFiltersState();
}

class _SubscribersFiltersState extends ConsumerState<SubscribersFilters> {
  CustomerRelation? _relation;
  CustomerStatus? _status;
  CustomerType? _type;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(customerFilterProvider);
    _relation = _relationFromFilter(filter.customerRelation);
    _type = _typeFromFilter(filter.planType);
    _initialized = true;
  }

  CustomerRelation? _relationFromFilter(String? value) {
    if (value == null) return null;
    for (final relation in CustomerRelation.values) {
      if (relation.name == value) return relation;
    }
    return null;
  }

  CustomerType? _typeFromFilter(String? value) {
    if (value == null) return null;
    for (final type in CustomerType.values) {
      if (type.name == value) return type;
    }
    return null;
  }

  Future<void> _applyFilters() async {
    ref.read(customerFilterProvider.notifier).updateFilter(
          ref.read(customerFilterProvider).copyWith(
            customerRelation: _relation?.name,
            planType: _type?.name,
            pageNumber: 1,
          ),
        );
    await ref.read(customerProvider.notifier).refresh();
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Filters'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterSection<CustomerRelation>(
              title: 'Relation',
              value: _relation,
              items: CustomerRelation.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _relation = value),
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<CustomerStatus>(
              title: 'Status',
              value: _status,
              items: CustomerStatus.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _status = value),
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<CustomerType>(
              title: 'Type',
              value: _type,
              items: CustomerType.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _type = value),
            ),
            SizedBox(height: context.spaceMedium),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _applyFilters,
                child: const Text('Apply Filter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
