import 'package:flutter/material.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import '../info_item/info_item.dart';

class SubscriberCardDetails extends StatelessWidget {
  final Customer customer;

  const SubscriberCardDetails({super.key, required this.customer});

  List<String> _addressValues() {
    final area = customer.areaName?.trim();
    final address = customer.address?.trim();
    final parts = [
      if (area != null && area.isNotEmpty) area,
      if (address != null && address.isNotEmpty) address,
    ];
    return parts.isEmpty ? ['-'] : parts;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoItem(label: 'Address', values: _addressValues()),
        InfoItem(
          label: customer.plan.label,
          values: [customer.planValue.toStringAsFixed(2)],
          isBold: true,
        ),
        InfoItem(
          label: 'Plan',
          values: [customer.plan.label],
        ),
      ],
    );
  }
}
