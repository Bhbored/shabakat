import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/data/app_data.dart';
import '../subscriber_card/subscriber_card.dart';

class SubscriberList extends StatelessWidget {
  final String searchQuery;
  final String statusFilter;

  const SubscriberList({
    super.key,
    required this.searchQuery,
    required this.statusFilter,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = allSubscribers.where((s) {
      final q = searchQuery.toLowerCase();
      final matchSearch = s.name.toLowerCase().contains(q) ||
          s.area.toLowerCase().contains(q) ||
          s.phone.contains(q);

      bool statusMatch = true;
      if (statusFilter != 'All') {
        statusMatch = s.status.name.toLowerCase() == statusFilter.toLowerCase();
      }

      return matchSearch && statusMatch;
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final s = filtered[index];
        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: SubscriberCard(subscriber: s),
        );
      },
    );
  }
}
