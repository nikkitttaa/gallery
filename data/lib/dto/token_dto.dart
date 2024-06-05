part of data;

@freezed
class TokenDTO with _$TokenDTO {
  const factory TokenDTO({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _TokenDTO;

  const TokenDTO._();

  TokenModel toModel() => TokenModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

  factory TokenDTO.fromJson(Map<String, dynamic> json) => _$TokenDTOFromJson(json);
}
