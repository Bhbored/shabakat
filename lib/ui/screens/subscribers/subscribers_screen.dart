import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/data/app_data.dart';
import 'widgets/subscribers_toolbar.dart';
import 'widgets/subscriber_list.dart';

class SubscribersScreen extends StatefulWidget {
  const SubscribersScreen({super.key});

  @override
  State<SubscribersScreen> createState() => _SubscribersScreenState();
}

class _SubscribersScreenState extends State<SubscribersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _statusFilter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int get _filteredCount {
    final q = _searchController.text.toLowerCase();
    return allSubscribers.where((s) {
      final matchSearch = s.name.toLowerCase().contains(q) ||
          s.area.toLowerCase().contains(q) ||
          s.phone.contains(q);
      bool statusMatch = true;
      if (_statusFilter != 'All') {
        statusMatch = s.status.name.toLowerCase() == _statusFilter.toLowerCase();
      }
      return matchSearch && statusMatch;
    }).length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubscribersToolbar(
          searchController: _searchController,
          onSearchChanged: (value) => setState(() {}),
          currentFilter: _statusFilter,
          onFilterChanged: (filter) => setState(() => _statusFilter = filter),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
          child: Text(
            '$_filteredCount of ${allSubscribers.length} subscribers',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
        SizedBox(height: context.spaceSmall),
        Expanded(
          child: SubscriberList(
            searchQuery: _searchController.text,
            statusFilter: _statusFilter,
          ),
        ),
      ],
    );
  }
}
