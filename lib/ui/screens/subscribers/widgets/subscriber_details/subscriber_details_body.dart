import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/customer_relation.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';

import 'subscriber_detail_row.dart';
import 'subscriber_detail_section.dart';
import 'subscriber_details_header.dart';
import 'subscriber_invoices_section.dart';

class SubscriberDetailsBody extends StatelessWidget {
  final Customer customer;

  const SubscriberDetailsBody({super.key, required this.customer});

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  String _formatAmount(double? amount) =>
      (amount ?? 0).toStringAsFixed(2);

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
                      icon: LucideIcons.mapPin,
                      label: 'Area',
                      value: customer.areaName ?? '-',
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.home,
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
                      icon: LucideIcons.calendarCheck,
                      label: 'Subscribed',
                      value: _formatDate(customer.subscriptionDate),
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.calendar,
                      label: 'Created',
                      value: _formatDate(customer.createdAt),
                    ),
                    if (customer.customerRelation != null)
                      SubscriberDetailRow(
                        icon: LucideIcons.users,
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
                      icon: LucideIcons.zap,
                      label: 'Type',
                      value: customer.plan.label,
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.gauge,
                      label: customer.plan.label,
                      value: customer.planValue.toStringAsFixed(2),
                      isHighlighted: true,
                    ),
                  ],
                ),
                SizedBox(height: context.spaceMedium),
                SubscriberDetailSection(
                  title: 'Billing Summary',
                  children: [
                    SubscriberDetailRow(
                      icon: LucideIcons.receipt,
                      label: 'Total Billed',
                      value: _formatAmount(customer.totalBilled),
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.banknote,
                      label: 'Total Paid',
                      value: _formatAmount(customer.totalPaid),
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.wallet,
                      label: 'Outstanding',
                      value: _formatAmount(customer.totalOutstanding),
                      isHighlighted: (customer.totalOutstanding ?? 0) > 0,
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
                          icon: LucideIcons.dollarSign,
                          label: 'Price',
                          value: customer.priceOverride!.toStringAsFixed(2),
                        ),
                      if (customer.fixedChargeOverride != null)
                        SubscriberDetailRow(
                          icon: LucideIcons.receipt,
                          label: 'Fixed Charge',
                          value:
                              customer.fixedChargeOverride!.toStringAsFixed(2),
                        ),
                      if (customer.tvaOverride != null)
                        SubscriberDetailRow(
                          icon: LucideIcons.percent,
                          label: 'TVA',
                          value: customer.tvaOverride!.toStringAsFixed(2),
                        ),
                    ],
                  ),
                ],
                SizedBox(height: context.spaceMedium),
                SubscriberInvoicesSection(
                  customerId: customer.id,
                  customerName: customer.name,
                  customerStatus: customer.customerStatus,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
