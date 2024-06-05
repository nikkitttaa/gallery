part of data;

@freezed
class ImageDTO with _$ImageDTO {
  const factory ImageDTO({
    required int id,
    required String name,
    required String? file,
  }) = _ImageDTO;

  const ImageDTO._();

  ImageModel toModel() => ImageModel(
        id: id,
        name: name,
        file: file,
      );

  factory ImageDTO.fromJson(Map<String, dynamic> json) => _$ImageDTOFromJson(json);
}
