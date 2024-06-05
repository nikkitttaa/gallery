part of presentation_authorization;

enum AuthorizationStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == AuthorizationStatus.initial;

  bool get isLoading => this == AuthorizationStatus.loading;

  bool get isSuccess => this == AuthorizationStatus.success;

  bool get isFailure => this == AuthorizationStatus.failure;
}

@freezed
class AuthorizationState with _$AuthorizationState {
  const factory AuthorizationState({
    @Default(AuthorizationStatus.initial) AuthorizationStatus status,
    @Default({}) Map<Field, ErrorInputField> errors,
  }) = _AuthorizationState;
}
