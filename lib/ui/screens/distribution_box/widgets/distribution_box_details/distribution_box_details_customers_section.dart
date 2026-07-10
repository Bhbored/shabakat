import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_list/subscriber_list.dart';

class DistributionBoxDetailsCustomersSection extends ConsumerWidget {
  final String boxId;

  const DistributionBoxDetailsCustomersSection({
    super.key,
    required this.boxId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final filter = ref.watch(customerFilterProvider);
    final customersAsync = ref.watch(customerProvider);

    if (filter.boxId != boxId) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.paddingMedium,
            0,
            context.paddingMedium,
            context.spaceSmall,
          ),
          child: Text(
            'distribution_boxes.details.subscribers_section'.tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: customersAsync.when(
            skipLoadingOnRefresh: true,
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) {
              if (err is ApiException) {
                return Center(
                  child: Text(err.userMessage, textAlign: TextAlign.center),
                );
              }
              return Center(
                child: Text(
                  'distribution_boxes.details.load_subscribers_failed'.tr(),
                ),
              );
            },
            data: (customers) {
              if (customers.isEmpty) {
                return Center(
                  child: Text(
                    'distribution_boxes.details.no_subscribers'.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                );
              }
              return SubscriberList(customers: customers);
            },
          ),
        ),
      ],
    );
  }
}
