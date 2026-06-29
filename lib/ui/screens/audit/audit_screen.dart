import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/audit/audit_log_filter_provider.dart';
import 'package:shabakat/data/providers/audit/audit_log_pagination_provider.dart';
import 'package:shabakat/data/providers/audit/audit_log_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';

import 'widgets/audit_log_list/audit_log_list.dart';
import 'widgets/audit_summary_bar/audit_summary_bar.dart';

class AuditScreen extends ConsumerWidget {
  const AuditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(auditLogProvider);
    final pagination = ref.watch(auditLogPaginationProvider);
    final filterNotifier = ref.read(auditLogFilterProvider.notifier);

    void goToPage(int page) {
      ref.read(auditLogFilterProvider.notifier).update(
        ref.read(auditLogFilterProvider).copyWith(pageNumber: page),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Activity Log'),
      ),
      body: logsAsync.when(
        skipLoadingOnRefresh: true,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => DynamicError(
          text: err is ApiException
              ? err.userMessage
              : 'Failed to load audit logs.',
          onTryAgain: () => ref.read(auditLogProvider.notifier).refresh(),
        ),
        data: (logs) => _AuditLayout(
          body: RefreshIndicator(
            onRefresh: () async {
              ref.read(auditLogFilterProvider.notifier).clear();
              ref.invalidate(auditLogProvider);
            },
            child: AuditLogList(logs: logs),
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
        ),
      ),
    );
  }
}

class _AuditLayout extends StatelessWidget {
  final Widget body;
  final Widget? pagination;

  const _AuditLayout({required this.body, this.pagination});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.spaceSmall,
            bottom: context.spaceSmall,
          ),
          child: const AuditSummaryBar(),
        ),
        Expanded(child: body),
        ?pagination,
      ],
    );
  }
}
