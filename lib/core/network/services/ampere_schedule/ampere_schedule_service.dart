import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/ampere_schedule/create_ampere_schedule_request.dart';
import 'package:shabakat/core/network/dto/request/ampere_schedule/update_ampere_schedule_request.dart';
import 'package:shabakat/core/network/dto/response/ampere_schedule/ampere_schedule_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'ampere_schedule_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
AmpereScheduleService ampereScheduleService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return AmpereScheduleService(apiExecutor);
}

class AmpereScheduleService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  AmpereScheduleService(this._apiExecutor);

  Future<List<AmpereScheduleResponse>> getAmpereSchedules() async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'ampere-schedules', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Ampere schedules retrieved successfully: $data');
        final datalist = data as List<dynamic>;
        final schedules = datalist
            .map((x) => AmpereScheduleResponse.fromJson(x))
            .toList();
        return schedules;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve ampere schedules: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> createAmpereSchedule(CreateAmpereScheduleRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'ampere-schedules',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Ampere schedule created successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to create ampere schedule: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> updateAmpereSchedule(
    String scheduleId,
    UpdateAmpereScheduleRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'ampere-schedules/$scheduleId',
        method: HttpMethod.put,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Ampere schedule updated successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update ampere schedule: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> deleteAmpereSchedule(String scheduleId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'ampere-schedules/$scheduleId',
        method: HttpMethod.delete,
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Ampere schedule deleted successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to delete ampere schedule: ${error.toString()}');
        throw error;
      },
    );
  }
}
