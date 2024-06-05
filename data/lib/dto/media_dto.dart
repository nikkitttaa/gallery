part of data;

@freezed
class MediaDTO with _$MediaDTO {
  const factory MediaDTO({
    required int id,
    required String name,
    required DateTime dateCreate,
    required String description,
    @JsonKey(name: 'new') required bool isNew,
    @JsonKey(name: 'popular') required bool isPopular,
    @JsonKey(name: 'image') required ImageDTO? imageData,
    @JsonKey(name: 'user') required String? userPath,
    UserDto? authorMedia,
  }) = _MediaDTO;
  

  const MediaDTO._();

  MediaModel toModel() => MediaModel(
        id: id,
        name: name,
        dateCreate: dateCreate,
        description: description,
        isNew: isNew,
        isPopular: isPopular,
        imageData: imageData?.toModel(),
        userPath: userPath,
      );

  factory MediaDTO.fromJson(Map<String, dynamic> json) => _$MediaDTOFromJson(json);
}
