part of domain;

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    required String accessToken,
    required String refreshToken,
  }) = _TokenModel;

}
