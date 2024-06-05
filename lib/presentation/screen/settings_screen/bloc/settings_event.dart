part of presentation_settings;

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadInfo() = _LoadInfo;

  const factory SettingsEvent.updateUser({
    required String username,
    DateTime? birthday,
    required String email,
    required String phone,
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) = _UpdateUser;

  const factory SettingsEvent.deleteUser() = _DeleteUser;

  const factory SettingsEvent.signOut() = _SignOut;
  const factory SettingsEvent.getLocale() = _GetLocale;

  const factory SettingsEvent.switchLanguage({
    required String locale,
  }) = _SwitchLanguage;
}
