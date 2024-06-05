part of domain;

abstract class TokenRepository {
  Future<String?> getAccessToken();

  Future<void> saveAccessToken(String accessToken);

  Future<void> deleteAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveRefreshToken(String refreshToken);

  Future<void> deleteRefreshToken();
}
