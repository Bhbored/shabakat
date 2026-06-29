import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/audit/audit_log_service.dart';
import 'package:shabakat/data/providers/audit/audit_log_filter_provider.dart';
import 'package:shabakat/data/providers/audit/audit_log_pagination_provider.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';
import 'package:shabakat/domain/mappers/audit/audit_log_mapper.dart';

part 'audit_log_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class AuditLogNotifier extends _$AuditLogNotifier {
  AuditLogService get _auditLogService => ref.read(auditLogServiceProvider);

  @override
  FutureOr<List<AuditLog>> build() async => _loadAuditLogs();

  Future<List<AuditLog>> _loadAuditLogs() async {
    final filter = ref.watch(auditLogFilterProvider);
    final response = await _auditLogService.getAuditLogs(filter);

    ref.read(auditLogPaginationProvider.notifier).update(
      AuditLogPagination(
        totalCount: response.totalCount,
        pageNumber: response.pageNumber,
        pageSize: response.pageSize,
        totalPages: response.totalPages,
        hasPreviousPage: response.hasPreviousPage,
        hasNextPage: response.hasNextPage,
      ),
    );

    return response.data.map((x) => x.toEntity()).toList();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_loadAuditLogs);
  }
}
