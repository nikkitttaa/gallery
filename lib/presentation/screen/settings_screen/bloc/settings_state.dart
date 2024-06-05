part of presentation_settings;

enum Status {
  loading,
  loaded,
  deleteSuccess,
  deleteFailure,
  updateSuccess,
  updateFailure,
  signOutSuccess,
  signOutFailure;

  bool get isLoading => this == Status.loading;

  bool get isLoaded => this == Status.loaded;

  bool get isDeleteSuccess => this == Status.deleteSuccess;

  bool get isDeleteFailure => this == Status.deleteFailure;

  bool get isUpdateSuccess => this == Status.updateSuccess;

  bool get isUpdateFailure => this == Status.updateFailure;

  bool get isSignOutSuccess => this == Status.signOutSuccess;

  bool get isSignOutFailure => this == Status.signOutFailure;
}

enum SettingsStatus { logOut, deleted }

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(Status.loading) Status status,
    UserModel? user,
    @Default(AppConst.enLocale) String locale,
  }) = _SettingsState;
}
