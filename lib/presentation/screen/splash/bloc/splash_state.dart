part of presentation_check_auth;

enum Status {
  loggedIn,
  notLoggedIn,
  initial,
  error;

  bool get isLoggedIn => this == Status.loggedIn;

  bool get isNotLoggedIn => this == Status.notLoggedIn;

  bool get isInitial => this == Status.initial;

  bool get isError => this == Status.error;
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(Status.initial) Status status,
  }) = _SplashState;
}
