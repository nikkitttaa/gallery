part of data;

class TokenInterceptor extends Interceptor {
  final TokenRepository tokenRepository;
  final AuthUseCase authUseCase;

  TokenInterceptor({
    required this.tokenRepository,
    required this.authUseCase,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await tokenRepository.getAccessToken();
    if (accessToken != null) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');
    }
    handler.next(options);
  }

  @override
  void onError(
    DioException err,
    handler,
  ) async {
    final refreshToken = await tokenRepository.getRefreshToken();
    switch (err.response?.statusCode) {
      case 401:
        if (refreshToken != null) {
          final accessToken = await authUseCase.refreshToken();

          err.requestOptions.headers.putIfAbsent('Authorization', () => 'Bearer $accessToken');

          return handler.resolve(
            await Dio().fetch(err.requestOptions),
          );
        }
        break;
      default:
        handler.reject(
          BadRequest(requestOptions: err.requestOptions),
        );
        break;
    }
    handler.next(err);
  }
}

class BadRequest extends DioException implements Exception {
  BadRequest({
    required RequestOptions requestOptions,
  }) : super(requestOptions: requestOptions);
}
