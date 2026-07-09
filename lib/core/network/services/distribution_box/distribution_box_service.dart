import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/create_distribution_box_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/distribution_box_filter_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/update_distribution_box_request.dart';
import 'package:shabakat/core/network/dto/response/distribution_box/distribution_box_list_response.dart';
import 'package:shabakat/core/network/dto/response/distribution_box/distribution_box_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'distribution_box_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
DistributionBoxService distributionBoxService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return DistributionBoxService(apiExecutor);
}

class DistributionBoxService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  DistributionBoxService(this._apiExecutor);

  Future<DistributionBoxListResponse> getDistributionBoxes(
    DistributionBoxFilterRequest filter,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'distribution-boxes',
        method: HttpMethod.get,
        queryParams: Map<String, dynamic>.from(filter.toJson())
          ..removeWhere((_, value) => value == null),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Distribution boxes retrieved successfully: $data');
        return DistributionBoxListResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve distribution boxes: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<DistributionBoxResponse> createDistributionBox(
    CreateDistributionBoxRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'distribution-boxes',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Distribution box created successfully: $data');
        return DistributionBoxResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to create distribution box: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<DistributionBoxResponse> updateDistributionBox(
    String boxId,
    UpdateDistributionBoxRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'distribution-boxes/$boxId',
        method: HttpMethod.put,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Distribution box updated successfully: $data');
        return DistributionBoxResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update distribution box: ${error.toString()}');
        throw error;
      },
    );
  }
}
