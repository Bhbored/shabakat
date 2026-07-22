import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/dashboard/dashboard_filter_request.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';

part 'dashboard_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
DashboardService dashboardService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return DashboardService(apiExecutor);
}

class DashboardService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  DashboardService(this._apiExecutor);

  Future<DashboardSummaryResponse> getSummary(
    DashboardFilterRequest filter,
  ) async {
    final queryParams = filter.toQueryParams();

    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'dashboard/summary',
        method: HttpMethod.get,
        queryParams: queryParams,
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Dashboard summary retrieved successfully: $data');
        return DashboardSummaryResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve dashboard summary: ${error.toString()}');
        throw error;
      },
    );
  }
}
