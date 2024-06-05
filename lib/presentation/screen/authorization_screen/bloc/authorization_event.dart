part of presentation_authorization;

@freezed
class AuthorizationEvent with _$AuthorizationEvent {
  const factory AuthorizationEvent.signIn({
    required String password,
    required String email,
  }) = _SignIn;

  const factory AuthorizationEvent.validateEmail({
    required String? email,
  }) = _ValidateEmail;

  const factory AuthorizationEvent.validatePassword({
    required String? password,
  }) = _ValidatePassword;
}
