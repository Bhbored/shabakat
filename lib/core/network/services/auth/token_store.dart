import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/storage/secure_storage/secure_storage_android.dart';

part 'token_store.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
TokenStore authTokenStore(Ref ref) {
  return TokenStore(ref.read(secureStorageAndroidProvider));
}

const _accessTokenKey = 'access_token';

class TokenStore {
  TokenStore(this._secureStorage);

  final SecureStorageAndroid _secureStorage;
  String? _cachedAccessToken;
  var _accessTokenHydrated = false;

  Future<String?> getAccessToken() async {
    if (_accessTokenHydrated) return _cachedAccessToken;
    _cachedAccessToken = await _secureStorage.getValue(_accessTokenKey);
    _accessTokenHydrated = true;
    return _cachedAccessToken;
  }

  Future<void> persistAuthResponse(Map<String, dynamic> data) async {
    final token = data['token'];
    if (token is String && token.isNotEmpty) {
      _cachedAccessToken = token;
      _accessTokenHydrated = true;
      await _secureStorage.setValue(_accessTokenKey, token);
    }
  }

  Future<void> clear() async {
    _cachedAccessToken = null;
    _accessTokenHydrated = true;
    await _secureStorage.deleteValue(_accessTokenKey);
  }
}
