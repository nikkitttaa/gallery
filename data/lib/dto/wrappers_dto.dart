part of data;

@Freezed(genericArgumentFactories: true)
class WrapperDTO<T> with _$WrapperDTO<T> {
  const factory WrapperDTO({
    required List<T> data,
  }) = _WrapperDTO;

  factory WrapperDTO.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$WrapperDTOFromJson(json, fromJsonT);
}
