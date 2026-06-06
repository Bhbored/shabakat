import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/area/create_area_request.dart';
import 'package:shabakat/core/network/dto/request/area/update_area_request.dart';
import 'package:shabakat/core/network/dto/response/area/area_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'area_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
AreaService areaService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return AreaService(apiExecutor);
}

class AreaService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  AreaService(this._apiExecutor);

  Future<List<AreaResponse>> getAreas() async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'areas', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Areas retrieved successfully: $data');
        final datalist = data as Map<String, dynamic>;
        final areas = (datalist['data'] as List)
            .map((x) => AreaResponse.fromJson(x))
            .toList();
        return areas;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve areas: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> createArea(CreateAreaRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'areas',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Area created successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to create area: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> updateArea(
    String areaId,
    UpdateAreaRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'areas/$areaId',
        method: HttpMethod.put,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Area updated successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update area: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> deleteArea(String areaId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'areas/$areaId',
        method: HttpMethod.delete,
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Area deleted successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to delete area: ${error.toString()}');
        throw error;
      },
    );
  }
}
