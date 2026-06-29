import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/audit/audit_log_filter_provider.dart';
import 'package:shabakat/data/providers/audit/audit_log_provider.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/audit_skeleton.dart';

import 'widgets/audit_filter_chips/audit_filter_chips_row.dart';
import 'widgets/audit_log_list/audit_log_list.dart';
import 'widgets/audit_summary_bar/audit_summary_bar.dart';

class AuditScreen extends ConsumerWidget {
  const AuditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(auditLogProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('audit.title'.tr()),
      ),
      body: logsAsync.when(
        skipLoadingOnRefresh: true,
        loading: () => const AuditSkeleton(),
        error: (err, _) => DynamicError(
          text: err is ApiException
              ? err.userMessage
              : 'audit.load_failed'.tr(),
          onTryAgain: () => ref.read(auditLogProvider.notifier).refresh(),
        ),
        data: (logs) => _AuditLayout(
          body: RefreshIndicator(
            onRefresh: () async {
              ref.read(auditLogFilterProvider.notifier).clear();
              await ref.read(auditLogProvider.notifier).refresh();
            },
            child: AuditLogList(logs: logs),
          ),
        ),
      ),
    );
  }
}

class _AuditLayout extends StatelessWidget {
  final Widget body;

  const _AuditLayout({required this.body});

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
        const AuditFilterChipsRow(),
        Expanded(child: body),
      ],
    );
  }
}
