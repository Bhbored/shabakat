import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'subscriber_card.dart';

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
    // Dummy data for now, matching web project
    final List<Map<String, dynamic>> dummySubscribers = [
      { 'name': "Ahmad Khalil", 'phone': "+961 71 234 567", 'area': "Hamra", 'ampere': "5A", 'date': "Jan 15, 2024", 'status': 'paid', 'amount': 85 },
      { 'name': "Rania Mansour", 'phone': "+961 70 345 678", 'area': "Achrafieh", 'ampere': "10A", 'date': "Feb 1, 2024", 'status': 'unpaid', 'amount': 150 },
      { 'name': "Khalid Barakat", 'phone': "+961 76 456 789", 'area': "Verdun", 'ampere': "5A", 'date': "Nov 20, 2023", 'status': 'paid', 'amount': 85 },
      { 'name': "Lara Haddad", 'phone': "+961 78 567 890", 'area': "Gemmayzeh", 'ampere': "15A", 'date': "Mar 10, 2024", 'status': 'overdue', 'amount': 210 },
      { 'name': "Hassan Nassar", 'phone': "+961 71 678 901", 'area': "Mar Elias", 'ampere': "5A", 'date': "Jan 5, 2024", 'status': 'paid', 'amount': 85 },
    ];

    final filtered = dummySubscribers.where((s) {
      final nameMatch = s['name'].toString().toLowerCase().contains(searchQuery.toLowerCase());
      final areaMatch = s['area'].toString().toLowerCase().contains(searchQuery.toLowerCase());
      final phoneMatch = s['phone'].toString().contains(searchQuery);
      
      bool statusMatch = true;
      if (statusFilter != 'All') {
        statusMatch = s['status'].toString().toLowerCase() == statusFilter.toLowerCase();
      }
      
      return (nameMatch || areaMatch || phoneMatch) && statusMatch;
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final s = filtered[index];
        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: SubscriberCard(
            name: s['name'],
            phone: s['phone'],
            area: s['area'],
            ampere: s['ampere'],
            date: s['date'],
            status: s['status'],
            amount: s['amount'].toString(),
          ),
        );
      },
    );
  }
}
