part of domain;

@freezed
class UpdatePasswordModel with _$UpdatePasswordModel {
  const factory UpdatePasswordModel({
    required String oldPassword,
    required String newPassword,
  }) = _UpdatePasswordModel;
}
