import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/auth_service.dart';
import 'package:shabakat/core/storage/secure_storage/secure_storage_android.dart';

import '../../../core/network/dto/request/auth/auth_requests.dart';
part 'auth_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
class AuthStateNotifier extends _$AuthStateNotifier {
  AuthService get autherService => ref.read(authServiceProvider);
  SecureStorageAndroid get secureStorage =>
      ref.read(secureStorageAndroidProvider);
  @override
  FutureOr<bool> build() async {
    final token = await secureStorage.getValue('access_token');
    return token != null;
  }

  Future<void> login(LoginRequest request) async {
    state = const AsyncValue.loading();
    try {
      await autherService.login(request);
      state = AsyncValue.data(true);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> register(RegisterRequest request) async {
    state = const AsyncValue.loading();
    try {
      await autherService.register(request);
      state = AsyncValue.data(true);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    try {
      await autherService.logout();
      state = const AsyncValue.data(false);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
