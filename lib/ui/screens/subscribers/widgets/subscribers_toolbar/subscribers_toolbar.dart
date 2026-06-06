import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import '../../subscreens/subscribers_filters.dart';

class SubscribersToolbar extends ConsumerWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final String searchCriteria;
  final ValueChanged<String> onSearchCriteriaChanged;

  const SubscribersToolbar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.searchCriteria,
    required this.onSearchCriteriaChanged,
  });

  String _hintForCriteria(String criteria) {
    return switch (criteria) {
      'name' => 'Search by name...',
      'area' => 'Search by area...',
      'phone' => 'Search by phone...',
      _ => 'Search...',
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customerProvider).asData?.value ?? [];
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  onChanged: onSearchChanged,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: _hintForCriteria(searchCriteria),
                    prefixIcon: const Icon(Icons.search, size: 20),
                  ),
                ),
              ),
              SizedBox(width: context.paddingSmall),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: searchCriteria,
                  items: ['name', 'area', 'phone'].map((criteria) {
                    return DropdownMenuItem<String>(
                      value: criteria,
                      child: Text(
                        criteria[0].toUpperCase() + criteria.substring(1),
                        style: theme.textTheme.bodyMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) onSearchCriteriaChanged(value);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(openInnerScreen(widget: const SubscribersFilters()));
                },
              ),
            ],
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            '${customers.length} subscribers',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
