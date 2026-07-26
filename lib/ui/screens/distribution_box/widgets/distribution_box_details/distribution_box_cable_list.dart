import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import 'distribution_box_cable_card.dart';

class DistributionBoxCableList extends StatelessWidget {
  final List<Customer> customers;

  const DistributionBoxCableList({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: customers.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: DistributionBoxCableCard(customer: customers[index]),
        );
      },
    );
  }
}
