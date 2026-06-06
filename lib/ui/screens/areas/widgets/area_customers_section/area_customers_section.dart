import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_list/subscriber_list.dart';

class AreaCustomersSection extends ConsumerWidget {
  const AreaCustomersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customersAsync = ref.watch(customerProvider);

    return Expanded(
      child: Column(
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
              'Subscribers',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: customersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) {
                if (err is ApiException) {
                  return Center(
                    child: Text(err.userMessage, textAlign: TextAlign.center),
                  );
                }
                return Center(
                  child: Text('Error loading subscribers: $err'),
                );
              },
              data: (customers) {
                if (customers.isEmpty) {
                  return Center(
                    child: Text(
                      'No subscribers in this area',
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
      ),
    );
  }
}
