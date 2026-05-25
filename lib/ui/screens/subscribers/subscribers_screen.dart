import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscribers',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.plus),
          ),
          SizedBox(width: context.paddingSmall),
        ],
      ),
      body: Column(
        children: [
          SubscribersToolbar(
            searchController: _searchController,
            onSearchChanged: (value) => setState(() {}),
            currentFilter: _statusFilter,
            onFilterChanged: (filter) => setState(() => _statusFilter = filter),
          ),
          Expanded(
            child: SubscriberList(
              searchQuery: _searchController.text,
              statusFilter: _statusFilter,
            ),
          ),
        ],
      ),
    );
  }
}
