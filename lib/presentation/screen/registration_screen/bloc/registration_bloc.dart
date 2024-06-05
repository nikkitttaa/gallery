part of presentation_registration;

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({
    required this.userRepository,
    required this.authUseCase,
  }) : super(const RegistrationState()) {
    on<_SignUp>(_signUp);
    on<_ValidateUsername>(_validateUsername);
    on<_ValidatePhone>(_validatePhone);
    on<_ValidateEmail>(_validateEmail);
    on<_ValidatePassword>(_validatePassword);
    on<_ValidateConfirmPassword>(_validateConfirmPassword);
  }

  final AuthRepository userRepository;
  final AuthUseCase authUseCase;

  FutureOr<void> _signUp(
    _SignUp event,
    Emitter<RegistrationState> emit,
  ) async {
    final errors = <Field, ErrorInputField>{
      ...FieldValidation.emailValidate(email: event.email),
      ...FieldValidation.passwordValidate(password: event.password),
      ...FieldValidation.usernameValidate(username: event.username),
      ...FieldValidation.confirmPasswordValidate(
        confirmPassword: event.confirmPassword,
        password: event.password,
      ),
      ...FieldValidation.phoneValidate(phone: event.phone),
    };

    if (errors.isNotEmpty) {
      return emit(
        state.copyWith(
          errors: errors,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: RegistrationStatus.loading,
        ),
      );
      try {
        await authUseCase.signUp(
          email: event.email,
          password: event.password,
          phone: event.phone,
          username: event.username,
          birthday: event.birthday,
        );

        await authUseCase.signIn(
          email: event.email,
          password: event.password,
        );

        emit(
          state.copyWith(
            status: RegistrationStatus.success,
          ),
        );
      } catch (_) {
        emit(
          state.copyWith(
            status: RegistrationStatus.error,
          ),
        );
      }
    }
  }

  FutureOr<void> _validateUsername(
    _ValidateUsername event,
    Emitter<RegistrationState> emit,
  ) {
    if (event.username != null) {
      final errors = FieldValidation.usernameValidate(username: event.username!);

      emit(
        state.copyWith(
          errors: {
            ...state.errors,
          }
            ..remove(Field.username)
            ..addAll(errors),
        ),
      );
    }
  }

  FutureOr<void> _validatePhone(
    _ValidatePhone event,
    Emitter<RegistrationState> emit,
  ) {
    if (event.phone != null) {
      final errors = FieldValidation.phoneValidate(phone: event.phone!);

      emit(
        state.copyWith(
          errors: {
            ...state.errors,
          }
            ..remove(Field.phone)
            ..addAll(errors),
        ),
      );
    }
  }

  FutureOr<void> _validateEmail(
    _ValidateEmail event,
    Emitter<RegistrationState> emit,
  ) {
    if (event.email != null) {
      final errors = FieldValidation.emailValidate(email: event.email!);

      emit(
        state.copyWith(
          errors: {
            ...state.errors,
          }
            ..remove(Field.email)
            ..addAll(errors),
        ),
      );
    }
  }

  FutureOr<void> _validatePassword(
    _ValidatePassword event,
    Emitter<RegistrationState> emit,
  ) {
    if (event.password != null) {
      final errors = FieldValidation.passwordValidate(password: event.password!);

      emit(
        state.copyWith(
          errors: {
            ...state.errors,
          }
            ..remove(Field.password)
            ..addAll(errors),
        ),
      );
    }
  }

  FutureOr<void> _validateConfirmPassword(
    _ValidateConfirmPassword event,
    Emitter<RegistrationState> emit,
  ) {
    if (event.confirmPassword != null) {
      final errors = FieldValidation.confirmPasswordValidate(
        confirmPassword: event.confirmPassword!,
        password: event.password!,
      );

      emit(
        state.copyWith(
          errors: {
            ...state.errors,
          }
            ..remove(Field.confirmPassword)
            ..addAll(errors),
        ),
      );
    }
  }
}
