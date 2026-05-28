import 'package:shabakat/core/network/dto/request/auth/auth_requests.dart';

import '../dto/response/auth/auth_response.dart';

abstract class IAuthService {
  Future<String> getAccessToken();
  Future<AuthResponse?> login(LoginRequest request);
  Future<AuthResponse?> register(RegisterRequest request);
  Future<void> logout();
}
