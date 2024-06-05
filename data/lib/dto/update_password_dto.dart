part of data;

@freezed
class UpdatePasswordDTO with _$UpdatePasswordDTO {
  const factory UpdatePasswordDTO({
    required String oldPassword,
    required String newPassword,
  }) = _UpdatePasswordDTO;

  const UpdatePasswordDTO._();

  UpdatePasswordModel toModel() => UpdatePasswordModel(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

  factory UpdatePasswordDTO.fromJson(Map<String, dynamic> json) => _$UpdatePasswordDTOFromJson(json);
}
