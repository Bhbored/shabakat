import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_card/invoice_card.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_details/subscriber_detail_row.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_details/subscriber_detail_section.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_details/subscriber_details_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubscriberDetailsSkeleton extends StatelessWidget {
  const SubscriberDetailsSkeleton({super.key});

  static final _mockCustomer = Customer(
    id: 'skeleton',
    createdAt: DateTime(2024, 1, 1),
    updatedAt: DateTime(2024, 1, 1),
    companyId: 'company',
    name: 'Subscriber Name',
    phone: '+961 00 000 000',
    address: 'Sample address',
    building: '12',
    floor: '3',
    areaName: 'Sample Area',
    boxName: 'Box A',
    cableName: 'Cable 01',
    customerType: CustomerType.residential,
    customerRelation: CustomerRelation.owner,
    subscriptionDate: DateTime(2024, 6, 1),
    plan: PlanType.ampere,
    planValue: 5.0,
    totalBilled: 1200,
    totalPaid: 900,
    totalOutstanding: 300,
  );

  static final _mockInvoices = List.generate(
    3,
    (index) => Invoice(
      id: 'skeleton-$index',
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
      companyId: 'company',
      customerId: 'skeleton',
      customerName: 'Subscriber Name',
      invoiceNumber: 1000 + index,
      issueDate: DateTime(2024, 6, 1),
      dueDate: DateTime(2024, 7, 1),
      fixedCharge: 10,
      tva: 2,
      totalAmount: 150,
      paidAmount: 50,
      amountDue: 100,
      invoiceStatus: InvoiceStatus.unpaid,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: context.scrollPaddingAboveMainNav),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubscriberDetailsHeader(customer: _mockCustomer),
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
                          label: 'subscribers.form.address'.tr(),
                          value: 'Sample Area\nSample address · Building 12 · Floor 3',
                        ),
                      ],
                    ),
                    SizedBox(height: context.spaceMedium),
                    SubscriberDetailSection(
                      title: 'subscribers.details.section.box_cable'.tr(),
                      children: [
                        SubscriberDetailRow(
                          icon: LucideIcons.box,
                          label: 'subscribers.form.distribution_box'.tr(),
                          value: 'Box A',
                        ),
                        SubscriberDetailRow(
                          icon: LucideIcons.link2,
                          label: 'subscribers.form.cable_name'.tr(),
                          value: 'Cable 01',
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
                          value: '01/06/2024',
                        ),
                        SubscriberDetailRow(
                          icon: LucideIcons.calendar,
                          label: 'subscribers.details.created'.tr(),
                          value: '01/01/2024',
                        ),
                        SubscriberDetailRow(
                          icon: LucideIcons.users,
                          label: 'subscribers.form.customer_relation'.tr(),
                          value: CustomerRelation.owner.label,
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
                          value: PlanType.ampere.label,
                        ),
                        SubscriberDetailRow(
                          icon: LucideIcons.gauge,
                          label: 'subscribers.form.plan_value'.tr(),
                          value: '5.00',
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
                          value: '1200.00',
                        ),
                        SubscriberDetailRow(
                          icon: LucideIcons.banknote,
                          label: 'subscribers.details.total_paid'.tr(),
                          value: '900.00',
                        ),
                        SubscriberDetailRow(
                          icon: LucideIcons.wallet,
                          label: 'subscribers.details.outstanding'.tr(),
                          value: '300.00',
                          isHighlighted: true,
                        ),
                      ],
                    ),
                    SizedBox(height: context.spaceMedium),
                    const _InvoicesSectionSkeleton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InvoicesSectionSkeleton extends StatelessWidget {
  const _InvoicesSectionSkeleton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'subscribers.invoices.title'.tr(),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const IconButton(
                  icon: Icon(Icons.add),
                  onPressed: null,
                ),
                const IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: null,
                ),
                const IconButton(
                  icon: Icon(Icons.chevron_right),
                  onPressed: null,
                ),
              ],
            ),
            SizedBox(height: context.spaceSmall),
            Divider(color: colorScheme.outline.withValues(alpha: 0.5)),
            SizedBox(height: context.spaceSmall),
            for (var i = 0;
                i < SubscriberDetailsSkeleton._mockInvoices.length;
                i++) ...[
              if (i > 0) SizedBox(height: context.spaceSmall),
              InvoiceCard(
                invoice: SubscriberDetailsSkeleton._mockInvoices[i],
                readOnly: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
