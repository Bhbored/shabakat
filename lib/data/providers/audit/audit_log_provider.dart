import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/response/audit/audit_log_list_response.dart';
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
  FutureOr<List<AuditLog>> build() async {
    ref.watch(auditLogFilterProvider);
    return _loadAuditLogs(pageNumber: 1);
  }

  Future<List<AuditLog>> _loadAuditLogs({required int pageNumber}) async {
    final filter = ref
        .read(auditLogFilterProvider)
        .copyWith(pageNumber: pageNumber);
    final response = await _auditLogService.getAuditLogs(filter);

    final isLoadingMore = ref.read(auditLogPaginationProvider).isLoadingMore;
    final hasNextPage = _resolveHasNextPage(response);

    ref.read(auditLogPaginationProvider.notifier).update(
      AuditLogPagination(
        totalCount: response.totalCount,
        pageNumber: response.pageNumber,
        pageSize: response.pageSize,
        totalPages: response.totalPages,
        hasPreviousPage: response.hasPreviousPage,
        hasNextPage: hasNextPage,
        isLoadingMore: isLoadingMore,
      ),
    );

    return response.data.map((x) => x.toEntity()).toList();
  }

  bool _resolveHasNextPage(AuditLogListResponse response) {
    if (response.hasNextPage) return true;
    if (response.totalPages > 0) {
      return response.pageNumber < response.totalPages;
    }
    return response.data.length < response.totalCount;
  }

  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null) return;

    final pagination = ref.read(auditLogPaginationProvider);
    if (!pagination.hasNextPage || pagination.isLoadingMore) return;

    ref.read(auditLogPaginationProvider.notifier).setLoadingMore(true);
    try {
      final nextPage = pagination.pageNumber + 1;
      final more = await _loadAuditLogs(pageNumber: nextPage);
      state = AsyncData([...current, ...more]);
    } finally {
      ref.read(auditLogPaginationProvider.notifier).setLoadingMore(false);
    }
  }

  Future<void> refresh() async {
    ref.read(auditLogPaginationProvider.notifier).setLoadingMore(false);
    state = await AsyncValue.guard(() => _loadAuditLogs(pageNumber: 1));
  }
}
