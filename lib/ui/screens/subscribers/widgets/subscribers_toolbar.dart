import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class SubscribersToolbar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final String currentFilter;
  final ValueChanged<String> onFilterChanged;

  const SubscribersToolbar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Paid', 'Unpaid', 'Overdue'];

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: const InputDecoration(
              hintText: 'Search by name, area, or phone...',
              prefixIcon: Icon(Icons.search, size: 20),
            ),
          ),
          SizedBox(height: context.spaceSmall),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                final isActive = currentFilter == filter;
                return Padding(
                  padding: EdgeInsets.only(right: context.paddingSmall),
                  child: ChoiceChip(
                    label: Text(filter),
                    selected: isActive,
                    onSelected: (_) => onFilterChanged(filter),
                    showCheckmark: false,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
