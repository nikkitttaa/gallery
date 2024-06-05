part of presentation_registration;

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.singUp({
    required String username,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    DateTime? birthday,
  }) = _SignUp;

  const factory RegistrationEvent.validateUsername({
    required String? username,
  }) = _ValidateUsername;

  const factory RegistrationEvent.validatePhone({
    required String? phone,
  }) = _ValidatePhone;

  const factory RegistrationEvent.validateEmail({
    required String? email,
  }) = _ValidateEmail;

  const factory RegistrationEvent.validatePassword({
    required String? password,
  }) = _ValidatePassword;

  const factory RegistrationEvent.validateConfirmPassword({
    required String? password,
    required String? confirmPassword,
  }) = _ValidateConfirmPassword;
}
