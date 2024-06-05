part of domain;

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String name,
    required String? file,
    int? id,
  }) = _ImageModel;
}
