import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/auth/auth_service.dart';

import '../../../core/network/dto/request/auth/auth_requests.dart';
part 'auth_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
class AuthStateNotifier extends _$AuthStateNotifier {
  AuthService get _autherService => ref.read(authServiceProvider);

  @override
  FutureOr<bool> build() async {
    final token = await _autherService.getAccessToken();
    return token.isNotEmpty;
  }

  Future<void> login(LoginRequest request) async {
    state = const AsyncValue.loading();
    try {
      await _autherService.login(request);
      state = AsyncValue.data(true);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> register(RegisterCompanyRequest request) async {
    state = const AsyncValue.loading();
    try {
      await _autherService.register(request);
      state = AsyncValue.data(true);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await _autherService.logout();
      state = const AsyncValue.data(false);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
