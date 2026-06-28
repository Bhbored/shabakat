import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';

class InvoicesToolbar extends ConsumerWidget {
  const InvoicesToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagination = ref.watch(invoicePaginationProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        context.paddingMedium,
        context.paddingMedium,
        0,
      ),
      child: Text(
        pagination.totalCount == 1
            ? 'invoices.count_one'.tr()
            : 'invoices.count'.tr(args: [pagination.totalCount.toString()]),
        style: theme.textTheme.bodySmall?.copyWith(
          color: colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
