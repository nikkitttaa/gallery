part of domain;

abstract class AuthRepository {
  Future<void> signUp({
    required String email,
    required String password,
    required String phone,
    required String username,
    DateTime? birthday,
  });

  Future<TokenModel> signIn({
    required String email,
    required String password,
  });

  Future<TokenModel> refreshAccessToken({
    required String? refreshToken,
  });
}
