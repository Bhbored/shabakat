import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'status_filter/status_filter.dart';

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
          StatusFilter(
            currentFilter: currentFilter,
            onFilterChanged: onFilterChanged,
          ),
        ],
      ),
    );
  }
}
