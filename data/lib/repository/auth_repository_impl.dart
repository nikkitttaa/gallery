part of data;

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.service,
  });

  final AuthServices service;

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String phone,
    required String username,
    DateTime? birthday,
  }) async =>
      service.signUp(
        RegistrationRequest(
          email: email,
          phone: phone,
          password: password,
          username: username,
          birthday: birthday,
        ),
      );

  @override
  Future<TokenModel> signIn({
    required String email,
    required String password,
  }) async {
    final user = await service.signIn(
      clientId: AppConst.clientId,
      grantType: AppConst.grantTypeForLogin,
      username: email,
      password: password,
      clientSecret: AppConst.clientSecret,
    );
    final userModel = user.toModel();

    return userModel;
  }

  @override
  Future<TokenModel> refreshAccessToken({
    required String? refreshToken,
  }) async {
    final refresh = await service.refreshToken(
      clientId: AppConst.clientId,
      grantType: AppConst.grantTypeForRefresh,
      refreshToken: refreshToken!,
      clientSecret: AppConst.clientSecret,
    );

    return refresh.toModel();
  }
}
