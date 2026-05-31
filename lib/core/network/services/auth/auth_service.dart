import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/contracts/i_auth_service.dart';
import 'package:shabakat/core/network/dto/request/auth/login_request.dart';
import 'package:shabakat/core/network/dto/request/auth/register_request.dart';
import 'package:shabakat/core/network/dto/response/auth/auth_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
import 'package:shabakat/core/network/services/auth/token_store.dart';
part 'auth_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
AuthService authService(Ref ref) {
  final DioClient dioClient = ref.read(
    dioClientProvider(null, endpoint: 'auth/'),
  );
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  final tokenStore = ref.watch(authTokenStoreProvider);
  return AuthService(apiExecutor, tokenStore);
}

class AuthService implements IAuthService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  final TokenStore _tokenStore;
  AuthService(this._apiExecutor, this._tokenStore);
  @override
  Future<AuthResponse?> register(RegisterRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'register',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('User registered successfully: $data');
        _tokenStore.persistAuthResponse(data);
        return AuthResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to register user  ${error.toString()}');
        throw error;
      },
    );
  }

  @override
  Future<String> getAccessToken() async {
    final token = await _tokenStore.getAccessToken();
    if (token == null) {
      _logger.w('No access token found in secure storage');
    }
    return token ?? '';
  }

  @override
  Future<AuthResponse?> login(LoginRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'login',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('User logged in successfully: $data');
        _tokenStore.persistAuthResponse(data);
        return AuthResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to log in user: ${error.toString()}');
        throw error;
      },
    );
  }

  @override
  Future<void> logout() async {
    await _tokenStore.clear();
  }
}
