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
    final values = <String>[];
    final area = customer.areaName?.trim();

    if (area != null && area.isNotEmpty) {
      values.add(area);
    }

    final parts = <String>[];
    final address = customer.address?.trim();

    if (address != null && address.isNotEmpty) {
      parts.add(address);
    }

    final building = customer.building?.trim();
    final floor = customer.floor?.trim();

    if (building != null && building.isNotEmpty) {
      parts.add('subscribers.card.building'.tr(args: [building]));
    }
    if (floor != null && floor.isNotEmpty) {
      parts.add('subscribers.card.floor'.tr(args: [floor]));
    }

    if (parts.isNotEmpty) {
      values.add(parts.join(' · '));
    }

    return values.isEmpty ? ['subscribers.empty_value'.tr()] : values;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: InfoItem(
            label: 'subscribers.form.address'.tr(),
            values: _addressValues(),
          ),
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
