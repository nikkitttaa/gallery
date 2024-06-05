part of presentation_authorization;

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc({
    required this.authUseCase,
  }) : super(const AuthorizationState()) {
    on<_SignIn>(_signIn);
    on<_ValidateEmail>(_validateEmail);
    on<_ValidatePassword>(_validatePassword);
  }

  final AuthUseCase authUseCase;

  FutureOr<void> _signIn(
    _SignIn event,
    Emitter<AuthorizationState> emit,
  ) async {
    final errors = <Field, ErrorInputField>{
      ...FieldValidation.emailValidate(email: event.email),
      ...FieldValidation.passwordValidate(password: event.password),
    };

    emit(
      state.copyWith(
        errors: {
          ...state.errors,
        }
          ..remove(Field.email)
          ..remove(Field.password)
          ..addAll(errors),
      ),
    );

    try {
      emit(
        state.copyWith(
          status: AuthorizationStatus.loading,
        ),
      );

      await authUseCase.signIn(
        email: event.email,
        password: event.password,
      );

      emit(
        state.copyWith(
          status: AuthorizationStatus.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AuthorizationStatus.failure,
        ),
      );
    }
  }

  FutureOr<void> _validateEmail(
    _ValidateEmail event,
    Emitter<AuthorizationState> emit,
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
    Emitter<AuthorizationState> emit,
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
}
