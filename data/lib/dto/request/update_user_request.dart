part of data;

@freezed
class UpdateUserRequest with _$UpdateUserRequest {
  const factory UpdateUserRequest({
    required String username,
    @JsonKey(includeIfNull: false) DateTime? birthday,
    required String email,
    required String phone,
    required String fullName,
    required List<String> roles,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserRequestFromJson(json);
}
