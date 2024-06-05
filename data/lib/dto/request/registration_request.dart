part of data;

@freezed
class RegistrationRequest with _$RegistrationRequest {
  const factory RegistrationRequest({
    required String email,
    required String phone,
    required String password,
    required String username,
    @JsonKey(includeIfNull: false) DateTime? birthday,
  }) = _RegistrationRequest;

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) => _$RegistrationRequestFromJson(json);
}
