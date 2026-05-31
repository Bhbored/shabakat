import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import '../subscriber_card/subscriber_card.dart';

class SubscriberList extends StatelessWidget {
  final List<Customer> customers;

  const SubscriberList({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];
        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: SubscriberCard(customer: customer),
        );
      },
    );
  }
}
