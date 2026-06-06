import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class AreasToolbar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final int resultCount;
  final int totalCount;

  const AreasToolbar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.resultCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            maxLines: 1,
            decoration: const InputDecoration(
              hintText: 'Search by name...',
              prefixIcon: Icon(Icons.search, size: 20),
            ),
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            resultCount == totalCount
                ? '$totalCount areas'
                : '$resultCount of $totalCount areas',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
