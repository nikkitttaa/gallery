part of data;

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String email,
    String? phone,
    required String username,
    required bool enabled,
    required List<String> roles,
    String? fullName,
    DateTime? birthday,
  }) = _UserDto;

  const UserDto._();

  UserModel toModel() => UserModel(
        userName: username,
        phone: phone,
        email: email,
        birthday: birthday,
        id: id,
        enabled: enabled,
        roles: roles,
      );

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
}
