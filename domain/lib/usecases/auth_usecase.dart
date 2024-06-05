part of domain;

class AuthUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final TokenRepository tokenRepository;

  AuthUseCase({
    required this.authRepository,
    required this.tokenRepository,
    required this.userRepository,
  });

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final token = await authRepository.signIn(email: email, password: password);

    await tokenRepository.saveAccessToken(token.accessToken);
    await tokenRepository.saveRefreshToken(token.refreshToken);
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String phone,
    required String username,
    DateTime? birthday,
  }) async {
    await authRepository.signUp(
      email: email,
      password: password,
      phone: phone,
      username: username,
      birthday: birthday,
    );

    await signIn(
      email: email,
      password: password,
    );
  }

  Future<String?> refreshToken() async {
    final refreshToken = await tokenRepository.getRefreshToken();
    final token = await authRepository.refreshAccessToken(
      refreshToken: refreshToken,
    );

    await tokenRepository.saveAccessToken(token.accessToken);
    await tokenRepository.saveRefreshToken(token.refreshToken);

    return token.accessToken;
  }
}
