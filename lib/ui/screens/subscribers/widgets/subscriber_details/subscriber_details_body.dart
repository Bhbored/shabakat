import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import 'subscriber_detail_row.dart';
import 'subscriber_detail_section.dart';
import 'subscriber_details_header.dart';

class SubscriberDetailsBody extends StatelessWidget {
  final Customer customer;

  const SubscriberDetailsBody({super.key, required this.customer});

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  bool get _hasPricingOverrides =>
      customer.priceOverride != null ||
      customer.fixedChargeOverride != null ||
      customer.tvaOverride != null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: context.scrollPaddingAboveMainNav),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubscriberDetailsHeader(customer: customer),
          Padding(
            padding: EdgeInsets.all(context.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SubscriberDetailSection(
                  title: 'Location',
                  children: [
                    SubscriberDetailRow(
                      icon: Icons.location_on_outlined,
                      label: 'Area',
                      value: customer.areaName ?? '-',
                    ),
                    SubscriberDetailRow(
                      icon: Icons.home_outlined,
                      label: 'Address',
                      value: customer.address ?? '-',
                    ),
                  ],
                ),
                SizedBox(height: context.spaceMedium),
                SubscriberDetailSection(
                  title: 'Subscription',
                  children: [
                    SubscriberDetailRow(
                      icon: Icons.event_outlined,
                      label: 'Subscribed',
                      value: _formatDate(customer.subscriptionDate),
                    ),
                    SubscriberDetailRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Created',
                      value: _formatDate(customer.createdAt),
                    ),
                    if (customer.customerRelation != null)
                      SubscriberDetailRow(
                        icon: Icons.people_outline,
                        label: 'Relation',
                        value: customer.customerRelation!.label,
                      ),
                  ],
                ),
                SizedBox(height: context.spaceMedium),
                SubscriberDetailSection(
                  title: 'Plan',
                  children: [
                    SubscriberDetailRow(
                      icon: Icons.bolt_outlined,
                      label: 'Type',
                      value: customer.plan.label,
                    ),
                    SubscriberDetailRow(
                      icon: Icons.speed_outlined,
                      label: customer.plan.label,
                      value: customer.planValue.toStringAsFixed(2),
                      isHighlighted: true,
                    ),
                  ],
                ),
                if (_hasPricingOverrides) ...[
                  SizedBox(height: context.spaceMedium),
                  SubscriberDetailSection(
                    title: 'Pricing Overrides',
                    children: [
                      if (customer.priceOverride != null)
                        SubscriberDetailRow(
                          icon: Icons.attach_money,
                          label: 'Price',
                          value: customer.priceOverride!.toStringAsFixed(2),
                        ),
                      if (customer.fixedChargeOverride != null)
                        SubscriberDetailRow(
                          icon: Icons.receipt_long_outlined,
                          label: 'Fixed Charge',
                          value:
                              customer.fixedChargeOverride!.toStringAsFixed(2),
                        ),
                      if (customer.tvaOverride != null)
                        SubscriberDetailRow(
                          icon: Icons.percent,
                          label: 'TVA',
                          value: customer.tvaOverride!.toStringAsFixed(2),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
