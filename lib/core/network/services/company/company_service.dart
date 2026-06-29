import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/company/update_preferences_request.dart';
import 'package:shabakat/core/network/dto/request/company/update_profile_request.dart';
import 'package:shabakat/core/network/dto/response/company/get_preferences_response.dart';
import 'package:shabakat/core/network/dto/response/company/get_profile_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'company_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
CompanyService companyService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return CompanyService(apiExecutor);
}

class CompanyService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  CompanyService(this._apiExecutor);

  Future<void> updateProfile(UpdateProfileRequest request) async {
    final formData = FormData();

    if (request.name.trim().isNotEmpty) {
      formData.fields.add(MapEntry('name', request.name.trim()));
    }
    if (request.file != null) {
      final filePath = request.file!;
      formData.files.add(
        MapEntry(
          'file',
          await MultipartFile.fromFile(
            filePath,
            filename: p.basename(filePath),
          ),
        ),
      );
    }

    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'company/profile',
        method: HttpMethod.put,
        data: formData,
        options: Options(sendTimeout: const Duration(seconds: 60)),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Company profile updated successfully');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update company profile: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<GetProfileResponse> getProfile() async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'company/profile', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Company profile retrieved successfully: $data');
        return GetProfileResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve company profile: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<GetPreferencesResponse> getPreferences() async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'company/preferences', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Preferences retrieved successfully: $data');
        return GetPreferencesResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve preferences: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> upsertPreferences(UpdatePreferencesRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'company/preferences',
        method: HttpMethod.put,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Preferences saved successfully');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to save preferences: ${error.toString()}');
        throw error;
      },
    );
  }
}
