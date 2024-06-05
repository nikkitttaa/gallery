part of domain;

@freezed
class MediaModel with _$MediaModel {
  const factory MediaModel({
    required int id,
    required String name,
    required DateTime dateCreate,
    required String description,
    required bool isNew,
    required bool isPopular,
    required ImageModel? imageData,
    required String? userPath,
    UserModel? authorMedia,
  }) = _MediaModel;
}
