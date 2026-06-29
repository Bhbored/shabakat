import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/dto/request/audit/audit_log_filter_request.dart';
import 'package:shabakat/data/providers/audit/audit_log_pagination_provider.dart';

part 'audit_log_filter_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class AuditLogFilterNotifier extends _$AuditLogFilterNotifier {
  @override
  AuditLogFilterRequest build() => const AuditLogFilterRequest();

  void update(AuditLogFilterRequest next) => state = next;

  void clear() => state = const AuditLogFilterRequest();

  void nextPage() => state = state.copyWith(pageNumber: state.pageNumber + 1);

  void previousPage() =>
      state = state.copyWith(pageNumber: state.pageNumber - 1);

  void firstPage() => state = state.copyWith(pageNumber: 1);

  void lastPage() => state = state.copyWith(
    pageNumber: ref.read(auditLogPaginationProvider).totalPages,
  );
}
