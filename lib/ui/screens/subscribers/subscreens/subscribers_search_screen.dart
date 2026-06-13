import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';

class SubscribersSearchScreen extends ConsumerStatefulWidget {
  const SubscribersSearchScreen({super.key});

  @override
  ConsumerState<SubscribersSearchScreen> createState() =>
      _SubscribersSearchScreenState();
}

class _SubscribersSearchScreenState
    extends ConsumerState<SubscribersSearchScreen> {
  final _searchController = TextEditingController();
  late String _searchCriteria;
  bool _initialized = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(customerFilterProvider);
    _searchCriteria = _criteriaFromFilter(filter);
    _searchController.text = _queryFromFilter(filter, _searchCriteria);
    _initialized = true;
  }

  String _criteriaFromFilter(CustomerFilterRequest filter) {
    if (filter.name != null) return 'name';
    if (filter.areaId != null) return 'area';
    if (filter.phone != null) return 'phone';
    return 'name';
  }

  String _queryFromFilter(CustomerFilterRequest filter, String criteria) {
    return switch (criteria) {
      'name' => filter.name ?? '',
      'area' => filter.areaId ?? '',
      'phone' => filter.phone ?? '',
      _ => '',
    };
  }

  Future<void> _applySearch() async {
    final q = _searchController.text.trim().isEmpty
        ? null
        : _searchController.text.trim();

    ref.read(customerFilterProvider.notifier).updateFilter(
          ref.read(customerFilterProvider).copyWith(
            name: _searchCriteria == 'name' ? q : null,
            phone: _searchCriteria == 'phone' ? q : null,
            areaId: _searchCriteria == 'area' ? q : null,
            pageNumber: 1,
          ),
        );
    await ref.read(customerProvider.notifier).refresh();
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Search'),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) => _applySearch(),
                    onChanged: (_) => setState(() {}),
                    decoration: const InputDecoration(
                      hintText: 'Search customer',
                      prefixIcon: Icon(Icons.search, size: 20),
                    ),
                  ),
                ),
                SizedBox(width: context.paddingSmall),
                IconButton(
                  onPressed:
                      _searchController.text.isEmpty ? null : _clearSearch,
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            Wrap(
              spacing: context.paddingSmall,
              runSpacing: context.paddingSmall,
              children: ['name', 'area', 'phone'].map((criteria) {
                final label =
                    criteria[0].toUpperCase() + criteria.substring(1);
                return FilterChip(
                  label: Text(label),
                  selected: _searchCriteria == criteria,
                  onSelected: (_) =>
                      setState(() => _searchCriteria = criteria),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
