import 'package:easy_localization/easy_localization.dart';
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
import 'subscriber_meter_readings_section.dart';

class SubscriberDetailsBody extends StatelessWidget {
  final Customer customer;

  const SubscriberDetailsBody({super.key, required this.customer});

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }

  String _formatAmount(double? amount) => (amount ?? 0).toStringAsFixed(2);

  bool get _hasPricingOverrides =>
      customer.hasPricingOverride ||
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
                  title: 'subscribers.details.section.location'.tr(),
                  children: [
                    SubscriberDetailRow(
                      icon: LucideIcons.mapPin,
                      label: 'subscribers.form.area'.tr(),
                      value: customer.areaName ?? 'subscribers.empty_value'.tr(),
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.home,
                      label: 'subscribers.form.address'.tr(),
                      value: customer.address ?? 'subscribers.empty_value'.tr(),
                    ),
                  ],
                ),
                SizedBox(height: context.spaceMedium),
                SubscriberDetailSection(
                  title: 'subscribers.details.section.subscription'.tr(),
                  children: [
                    SubscriberDetailRow(
                      icon: LucideIcons.calendarCheck,
                      label: 'subscribers.details.subscribed'.tr(),
                      value: _formatDate(customer.subscriptionDate),
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.calendar,
                      label: 'subscribers.details.created'.tr(),
                      value: _formatDate(customer.createdAt),
                    ),
                    if (customer.customerRelation != null)
                      SubscriberDetailRow(
                        icon: LucideIcons.users,
                        label: 'subscribers.form.customer_relation'.tr(),
                        value: customer.customerRelation!.label,
                      ),
                  ],
                ),
                SizedBox(height: context.spaceMedium),
                SubscriberDetailSection(
                  title: 'subscribers.details.section.plan'.tr(),
                  children: [
                    SubscriberDetailRow(
                      icon: LucideIcons.zap,
                      label: 'subscribers.details.plan_type'.tr(),
                      value: customer.plan.label,
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.gauge,
                      label: 'subscribers.form.plan_value'.tr(),
                      value: customer.planValue.toStringAsFixed(2),
                      isHighlighted: true,
                    ),
                  ],
                ),
                SizedBox(height: context.spaceMedium),
                SubscriberDetailSection(
                  title: 'subscribers.details.section.billing_summary'.tr(),
                  children: [
                    SubscriberDetailRow(
                      icon: LucideIcons.receipt,
                      label: 'subscribers.details.total_billed'.tr(),
                      value: _formatAmount(customer.totalBilled),
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.banknote,
                      label: 'subscribers.details.total_paid'.tr(),
                      value: _formatAmount(customer.totalPaid),
                    ),
                    SubscriberDetailRow(
                      icon: LucideIcons.wallet,
                      label: 'subscribers.details.outstanding'.tr(),
                      value: _formatAmount(customer.totalOutstanding),
                      isHighlighted: (customer.totalOutstanding ?? 0) > 0,
                    ),
                  ],
                ),
                if (_hasPricingOverrides) ...[
                  SizedBox(height: context.spaceMedium),
                  SubscriberDetailSection(
                    title: 'subscribers.details.section.pricing_overrides'.tr(),
                    children: [
                      if (customer.priceOverride != null)
                        SubscriberDetailRow(
                          icon: LucideIcons.dollarSign,
                          label: 'subscribers.details.price'.tr(),
                          value: customer.priceOverride!.toStringAsFixed(2),
                        ),
                      if (customer.fixedChargeOverride != null)
                        SubscriberDetailRow(
                          icon: LucideIcons.receipt,
                          label: 'subscribers.details.fixed_charge'.tr(),
                          value: customer.fixedChargeOverride!.toStringAsFixed(
                            2,
                          ),
                        ),
                      if (customer.tvaOverride != null)
                        SubscriberDetailRow(
                          icon: LucideIcons.percent,
                          label: 'subscribers.details.tva'.tr(),
                          value: customer.tvaOverride!.toStringAsFixed(2),
                        ),
                    ],
                  ),
                ],
                if (customer.plan != PlanType.ampere) ...[
                  SizedBox(height: context.spaceMedium),
                  SubscriberMeterReadingsSection(
                    customerId: customer.id,
                    customerName: customer.name,
                    customerStatus: customer.customerStatus,
                    plan: customer.plan,
                  ),
                ],
                SizedBox(height: context.spaceMedium),
                SubscriberInvoicesSection(
                  customerId: customer.id,
                  customerName: customer.name,
                  customerStatus: customer.customerStatus,
                  plan: customer.plan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
