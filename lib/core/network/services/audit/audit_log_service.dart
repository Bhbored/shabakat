import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/audit/audit_log_filter_request.dart';
import 'package:shabakat/core/network/dto/response/audit/audit_log_list_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';

part 'audit_log_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
AuditLogService auditLogService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return AuditLogService(apiExecutor);
}

class AuditLogService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();

  AuditLogService(this._apiExecutor);

  Future<AuditLogListResponse> getAuditLogs(
    AuditLogFilterRequest filter,
  ) async {
    final queryParams = Map<String, dynamic>.from(filter.toJson())
      ..removeWhere((_, value) => value == null);

    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'audit-logs',
        method: HttpMethod.get,
        queryParams: queryParams,
      ),
    );

    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Audit logs retrieved successfully: $data');
        return AuditLogListResponse.fromJson(data as Map<String, dynamic>);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve audit logs: ${error.toString()}');
        throw error;
      },
    );
  }
}
