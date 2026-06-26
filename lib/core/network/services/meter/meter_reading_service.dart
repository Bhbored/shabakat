import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/meter/create_meter_reading_request.dart';
import 'package:shabakat/core/network/dto/response/meter/meter_reading_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'meter_reading_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
MeterReadingService meterReadingService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return MeterReadingService(apiExecutor);
}

class MeterReadingService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  MeterReadingService(this._apiExecutor);

  String _path(String customerId) => 'customers/$customerId/meter-readings';

  Future<List<MeterReadingResponse>> getMeterReadings(String customerId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: _path(customerId), method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Meter readings retrieved successfully: $data');
        return (data as List)
            .map((x) => MeterReadingResponse.fromJson(x))
            .toList();
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve meter readings: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<MeterReadingResponse> getLatestMeterReading(
    String customerId,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: '${_path(customerId)}/latest', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Latest meter reading retrieved successfully: $data');
        return MeterReadingResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e(
          'Failed to retrieve latest meter reading: ${error.toString()}',
        );
        throw error;
      },
    );
  }

  Future<MeterReadingResponse> createMeterReading(
    String customerId,
    CreateMeterReadingRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: _path(customerId),
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Meter reading created successfully: $data');
        return MeterReadingResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to create meter reading: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> deleteMeterReading(
    String customerId,
    String readingId,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: '${_path(customerId)}/$readingId',
        method: HttpMethod.delete,
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Meter reading deleted successfully');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to delete meter reading: ${error.toString()}');
        throw error;
      },
    );
  }
}
