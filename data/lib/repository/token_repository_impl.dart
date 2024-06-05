part of data;

class TokenRepositoryImpl implements TokenRepository {
  TokenRepositoryImpl({
    required this.secure,
    required this.service,
  });

  static const String _accessTokenKey = 'access_token';

  final AuthServices service;

  final storage.FlutterSecureStorage secure;

  @override
  Future<String?> getAccessToken() async {
    final access = await secure.read(key: _accessTokenKey);
    return access;
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await secure.write(key: _accessTokenKey, value: accessToken);
  }

  @override
  Future<void> deleteAccessToken() async {
    await secure.delete(key: _accessTokenKey);
  }

  static const String _refreshTokenKey = 'refresh_token';

  @override
  Future<String?> getRefreshToken() async {
    final refreshToken = await secure.read(key: _refreshTokenKey);
    return refreshToken;
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await secure.write(key: _refreshTokenKey, value: refreshToken);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await secure.delete(key: _refreshTokenKey);
  }
}
