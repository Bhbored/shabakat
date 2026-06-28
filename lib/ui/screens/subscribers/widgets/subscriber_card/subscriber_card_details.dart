import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
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
    return parts.isEmpty ? ['subscribers.empty_value'.tr()] : parts;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: InfoItem(label: 'subscribers.form.address'.tr(), values: _addressValues()),
        ),
        SizedBox(width: context.spaceSmall),
        Expanded(
          child: InfoItem(
            label: 'subscribers.form.plan_value'.tr(),
            values: [customer.planValue.toStringAsFixed(2)],
            isBold: true,
          ),
        ),
        SizedBox(width: context.spaceSmall),
        Expanded(
          child: InfoItem(
            label: 'subscribers.form.plan'.tr(),
            values: [customer.plan.label],
          ),
        ),
      ],
    );
  }
}
