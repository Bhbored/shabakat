import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audit_log_pagination_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class AuditLogPaginationNotifier extends _$AuditLogPaginationNotifier {
  @override
  AuditLogPagination build() => AuditLogPagination();

  void update(AuditLogPagination pagination) => state = pagination;
}

class AuditLogPagination {
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;

  AuditLogPagination({
    this.totalCount = 0,
    this.pageNumber = 0,
    this.pageSize = 0,
    this.totalPages = 0,
    this.hasPreviousPage = false,
    this.hasNextPage = false,
  });
}
