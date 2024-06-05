part of domain;

abstract class MediaRepository {
  Future<List<MediaModel>> getPhoto({
    required bool isNew,
    required int limit,
    required int page,
    required String? name,
    int? userId
  });

  Future<MediaModel> getFullMedia({
    required int id,
  });

  Future<ImageModel> addMedia({
    required File file,
    required String name,
  });

  Future<void> addPhotos({
    required String name,
    required DateTime dateCreate,
    required String? description,
    required bool isNew,
    required bool isPopular,
    required String imageIRI,
  });

  Future<List<MediaModel>> getUserMedia({
    required int userId,
    required int limit,
    required int page,
  });

  Future<void> deleteMediaObject({
    required int id,
  });

  Future<void> deletePhoto({
    required int id,
  });
}
