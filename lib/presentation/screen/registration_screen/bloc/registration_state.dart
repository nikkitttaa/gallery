part of presentation_registration;

enum RegistrationStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == RegistrationStatus.initial;

  bool get isLoading => this == RegistrationStatus.loading;

  bool get isSuccess => this == RegistrationStatus.success;

  bool get isError => this == RegistrationStatus.error;
}

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(RegistrationStatus.initial) RegistrationStatus status,
    @Default({}) Map<Field, ErrorInputField> errors,
  }) = _RegistrationState;
}
