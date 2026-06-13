import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';

import '../widgets/filter_section/filter_section.dart';

class SubscribersFilters extends ConsumerStatefulWidget {
  const SubscribersFilters({super.key});

  @override
  ConsumerState<SubscribersFilters> createState() => _SubscribersFiltersState();
}

class _SubscribersFiltersState extends ConsumerState<SubscribersFilters> {
  static const _lastInvoiceFilters = {'Paid', 'Unpaid'};

  CustomerRelation? _relation;
  String? _paymentFilter;
  PlanType? _planType;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(customerFilterProvider);
    _relation = _relationFromFilter(filter.customerRelation);
    _paymentFilter = _paymentFilterFromFilter(filter.paymentFilter);
    _planType = _planTypeFromFilter(filter.planType);
    _initialized = true;
  }

  CustomerRelation? _relationFromFilter(String? value) {
    if (value == null) return null;
    for (final relation in CustomerRelation.values) {
      if (relation.name == value) return relation;
    }
    return null;
  }

  String? _paymentFilterFromFilter(String? value) {
    if (value == null || !_lastInvoiceFilters.contains(value)) return null;
    return value;
  }

  PlanType? _planTypeFromFilter(String? value) {
    if (value == null) return null;
    for (final plan in PlanType.values) {
      if (plan.name == value.toLowerCase() || plan.label == value) {
        return plan;
      }
    }
    return null;
  }

  void _applyFilters() {
    ref
        .read(customerFilterProvider.notifier)
        .updateFilter(
          ref
              .read(customerFilterProvider)
              .copyWith(
                customerRelation: _relation?.name,
                paymentFilter: _paymentFilter,
                planType: _planType?.label,
                pageNumber: 1,
              ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLoading = ref.watch(customerProvider).isLoading;

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
            FilterSection<String>(
              title: 'Last Invoice',
              value: _paymentFilter,
              items: _lastInvoiceFilters.toList(),
              labelBuilder: (e) => e,
              onChanged: (value) => setState(() => _paymentFilter = value),
            ),
            SizedBox(height: context.spaceMedium),
            FilterSection<PlanType>(
              title: 'Plan',
              value: _planType,
              items: PlanType.values,
              labelBuilder: (e) => e.label,
              onChanged: (value) => setState(() => _planType = value),
            ),
            SizedBox(height: context.spaceMedium),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : _applyFilters,
                child: isLoading
                    ? SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onPrimary,
                        ),
                      )
                    : Text(
                        'Apply Filter',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
