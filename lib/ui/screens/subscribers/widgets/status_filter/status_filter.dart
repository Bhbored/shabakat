import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import '../filter_chip/filter_chip.dart';

class StatusFilter extends StatelessWidget {
  final String currentFilter;
  final ValueChanged<String> onFilterChanged;

  const StatusFilter({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Paid', 'Unpaid', 'Overdue'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isActive = currentFilter == filter;
          return Padding(
            padding: EdgeInsets.only(right: context.paddingSmall),
            child: StatusFilterChip(
              label: filter,
              isActive: isActive,
              onTap: () => onFilterChanged(filter),
            ),
          );
        }).toList(),
      ),
    );
  }
}
