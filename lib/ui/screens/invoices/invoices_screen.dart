import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/invoice/invoice_filter_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_pagination_provider.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/invoices_skeleton.dart';

import 'widgets/invoice_filter_chips/invoice_filter_chips_row.dart';
import 'widgets/invoice_list/invoice_list.dart';
import 'widgets/invoice_list/invoices_toolbar.dart';

class InvoicesScreen extends ConsumerStatefulWidget {
  const InvoicesScreen({super.key});

  @override
  ConsumerState<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends ConsumerState<InvoicesScreen> {
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
      error: (err, _) => _InvoicesLayout(
        body: DynamicError(
          text: err is ApiException
              ? err.userMessage
              : 'invoices.load_failed'.tr(),
          onTryAgain: () => ref.read(invoiceProvider.notifier).refresh(),
        ),
      ),
      data: (invoices) {
        final filterNotifier = ref.read(invoiceFilterProvider.notifier);

        return _InvoicesLayout(
          body: RefreshIndicator(
            onRefresh: () async {
              ref.read(invoiceFilterProvider.notifier).clearFilter();
              ref.invalidate(invoiceProvider);
            },
            child: InvoiceList(invoices: invoices),
          ),
          pagination: pagination.totalPages > 1
              ? SubscribersPagination(
                  currentPage: pagination.pageNumber,
                  totalPages: pagination.totalPages,
                  onPageChanged: goToPage,
                  onFirstPage: filterNotifier.firstPage,
                  onLastPage: filterNotifier.lastPage,
                )
              : null,
        );
      },
    );
  }
}

class _InvoicesLayout extends StatelessWidget {
  final Widget body;
  final Widget? pagination;

  const _InvoicesLayout({required this.body, this.pagination});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InvoicesToolbar(),
        const InvoiceFilterChipsRow(),
        Expanded(child: body),
        ?pagination,
      ],
    );
  }
}
