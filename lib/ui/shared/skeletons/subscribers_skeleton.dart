import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_card/subscriber_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubscribersSkeleton extends StatelessWidget {
  const SubscribersSkeleton({super.key});

  static const _itemCount = 6;

  static final _mockCustomers = List.generate(
    _itemCount,
    (index) => Customer(
      id: 'skeleton-$index',
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
      companyId: 'company',
      name: 'Subscriber Name',
      phone: '+961 00 000 000',
      address: 'Sample address',
      areaName: 'Sample Area',
      customerType: CustomerType.residential,
      subscriptionDate: DateTime(2024, 6, 1),
      plan: PlanType.ampere,
      planValue: 5.0,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SubscribersToolbarSkeleton(),
            SizedBox(height: context.spaceSmall),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
                itemCount: _mockCustomers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: context.spaceSmall),
                    child: SubscriberCard(
                      customer: _mockCustomers[index],
                      selectionMode: false,
                      isSelected: false,
                      onLongPress: () {},
                      onSelectionChanged: (_) {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubscribersToolbarSkeleton extends StatelessWidget {
  const _SubscribersToolbarSkeleton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final inputTheme = theme.inputDecorationTheme;
    final enabledBorder = inputTheme.enabledBorder;
    final borderRadius = enabledBorder is OutlineInputBorder
        ? enabledBorder.borderRadius
        : BorderRadius.circular(context.borderRadiusMedium);
    final borderSide = enabledBorder is OutlineInputBorder
        ? enabledBorder.borderSide
        : BorderSide(color: colorScheme.outline);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: context.paddingSmall,
                  ),
                  minLeadingWidth: 28,
                  tileColor: inputTheme.fillColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                    side: borderSide,
                  ),
                  leading: Icon(
                    Icons.search,
                    size: 20,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  title: Text(
                    'subscribers.search.hint_customer'.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            'areas.subscriber_count'.tr(args: ['128']),
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
