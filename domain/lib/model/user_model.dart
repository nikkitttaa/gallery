part of domain;

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String email,
    required bool enabled,
    required String userName,
    required List<String> roles,
    String? phone,
    String? fullName,
    DateTime? birthday,
  }) = _UserModel;
}
