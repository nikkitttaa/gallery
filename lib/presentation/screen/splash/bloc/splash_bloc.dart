part of presentation_check_auth;

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.userRepository,
    required this.authUseCase,
  }) : super(const SplashState()) {
    on<_Started>(_checkAuth);
  }

  final UserRepository userRepository;
  final AuthUseCase authUseCase;

  FutureOr<void> _checkAuth(
    _Started event,
    Emitter<SplashState> emit,
  ) async {
    try {
      await userRepository.getCurrentUser();

      emit(
        state.copyWith(
          status: Status.loggedIn,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: Status.notLoggedIn,
        ),
      );
    }
  }
}
