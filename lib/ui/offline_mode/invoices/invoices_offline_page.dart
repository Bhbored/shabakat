import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_filter_chips/invoice_filter_chips_row.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_list/invoice_list.dart';
import 'package:shabakat/ui/screens/invoices/widgets/invoice_list/invoices_toolbar.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/invoices_skeleton.dart';

class InvoicesOfflinePage extends ConsumerStatefulWidget {
  const InvoicesOfflinePage({super.key});

  @override
  ConsumerState<InvoicesOfflinePage> createState() =>
      _InvoicesOfflinePageState();
}

class _InvoicesOfflinePageState extends ConsumerState<InvoicesOfflinePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        ref.read(invoiceFilterProvider.notifier).clearFilter();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final invoicesAsync = ref.watch(invoiceProvider);
    final pagination = ref.watch(invoicePaginationProvider);
    final filterNotifier = ref.read(invoiceFilterProvider.notifier);

    void goToPage(int page) {
      ref
          .read(invoiceFilterProvider.notifier)
          .updateFilter(
            ref.read(invoiceFilterProvider).copyWith(pageNumber: page),
          );
    }

    return invoicesAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const InvoicesSkeleton(),
      error: (err, _) => DynamicError(
        text: err is ApiException
            ? err.userMessage
            : 'invoices.load_failed'.tr(),
        onTryAgain: () => ref.read(invoiceProvider.notifier).refresh(),
      ),
      data: (invoices) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InvoicesToolbar(),
          const InvoiceFilterChipsRow(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.read(invoiceFilterProvider.notifier).clearFilter();
                ref.invalidate(invoiceProvider);
              },
              child: InvoiceList(invoices: invoices, readOnly: true),
            ),
          ),
          if (pagination.totalPages > 1)
            SubscribersPagination(
              currentPage: pagination.pageNumber,
              totalPages: pagination.totalPages,
              onPageChanged: goToPage,
              onFirstPage: filterNotifier.firstPage,
              onLastPage: filterNotifier.lastPage,
            ),
        ],
      ),
    );
  }
}
