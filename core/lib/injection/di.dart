part of core;

final GetIt locator = GetIt.instance;

final FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<void> initializeDependencies() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConst.baseUrl,
    ),
  );

  locator
    ..registerLazySingleton(
      () => dio,
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        service: AuthServices(locator()),
      ),
    )
    ..registerLazySingleton<MediaRepository>(
      () => MediaRepositoryImpl(
        mediaService: MediaService(locator()),
      ),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        service: UserServices(locator()),
      ),
    )
    ..registerLazySingleton<TokenRepository>(
      () => TokenRepositoryImpl(
        secure: secureStorage,
        service: AuthServices(locator()),
      ),
    )
    ..registerLazySingleton<AuthUseCase>(
      () => AuthUseCase(
        authRepository: locator(),
        tokenRepository: locator(),
        userRepository: locator(),
      ),
    )
    ..registerLazySingleton<MediaUseCase>(
      () => MediaUseCase(
        mediaRepository: locator(),
        userRepository: locator(),
      ),
    )
    ..registerLazySingleton<UserUseCase>(
      () => UserUseCase(
        userRepository: locator(),
        tokenRepository: locator(),
      ),
    );

  dio.interceptors.addAll(
    [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
      TokenInterceptor(
        tokenRepository: locator(),
        authUseCase: locator(),
      ),
    ],
  );
}
