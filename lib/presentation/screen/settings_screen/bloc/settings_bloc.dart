part of presentation_settings;

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.userUseCase,
  }) : super(const SettingsState()) {
    on<_LoadInfo>(_loadInfo);
    on<_DeleteUser>(_deleteUser);
    on<_UpdateUser>(_updateUser);
    on<_SignOut>(_signOut);
    on<_SwitchLanguage>(_switchLanguage);
    on<_GetLocale>(_getLocale);
  }

  final UserUseCase userUseCase;

  FutureOr<void> _loadInfo(
    _LoadInfo event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    final user = await userUseCase.getCurrentUser();

    emit(
      state.copyWith(
        user: user,
        status: Status.loaded,
      ),
    );
  }

  FutureOr<void> _updateUser(
    _UpdateUser event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );

      final user = await userUseCase.getCurrentUser();

      await userUseCase.updateUser(
        id: user.id,
        username: event.username,
        email: event.email,
        phone: event.phone,
        birthday: event.birthday,
        roles: user.roles,
        fullName: user.fullName ?? AppConst.empty,
      );

      if (event.newPassword.isNotEmpty) {
        await userUseCase.updatePassword(
          id: user.id,
          oldPassword: event.oldPassword,
          newPassword: event.newPassword,
        );
      }

      emit(
        state.copyWith(
          status: Status.updateSuccess,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: Status.updateFailure,
        ),
      );
    }
  }

  FutureOr<void> _signOut(
    _SignOut event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      await userUseCase.signOut();
      emit(
        state.copyWith(
          status: Status.signOutSuccess,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: Status.signOutFailure,
        ),
      );
    }
  }

  FutureOr<void> _deleteUser(
    _DeleteUser event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final user = await userUseCase.getCurrentUser();

      await userUseCase.deleteUser(id: user.id);

      emit(
        state.copyWith(
          status: Status.deleteSuccess,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: Status.deleteFailure,
        ),
      );
    }
  }

  FutureOr<void> _switchLanguage(
    _SwitchLanguage event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', event.locale);

    emit(
      state.copyWith(
        locale: event.locale,
        status: Status.loaded,
      ),
    );
  }

  FutureOr<void> _getLocale(
    _GetLocale event,
    Emitter<SettingsState> emit,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(
      state.copyWith(
        locale: (prefs.getString('locale') ?? AppConst.ruLocale),
      ),
    );
  }
}
