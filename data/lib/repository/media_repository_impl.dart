part of data;

class MediaRepositoryImpl implements MediaRepository {
  final MediaService mediaService;

  MediaRepositoryImpl({required this.mediaService});

  @override
  Future<List<MediaModel>> getPhoto({
    required bool isNew,
    required int limit,
    required int page,
    required String? name,
    int? userId,
  }) async {
    final photos = await mediaService.getPhoto(
      PhotoRequestDTO(
        isNew: isNew,
        isPopular: !isNew,
        limit: limit,
        page: page,
        name: name,
        userId: userId
      ),
    );
    final photoList = photos.data
        .map(
          (e) => e.toModel(),
        )
        .toList();
    return photoList;
  }

  @override
  Future<MediaModel> getFullMedia({
    required int id,
  }) async {
    final media = await mediaService.getFullMedia(id: id);
    return media.toModel();
  }

  @override
  Future<ImageModel> addMedia({
    required File file,
    required String name,
  }) async {
    final media = await mediaService.addMedia(
      file: file,
    );
    final mediaModel = media.toModel();
    return mediaModel;
  }

  @override
  Future<void> addPhotos({
    required String name,
    required DateTime dateCreate,
    required String? description,
    required bool isNew,
    required bool isPopular,
    required String imageIRI,
  }) async =>
      mediaService.addPhotos(
        PhotosRequest(
          name: name,
          dateCreate: dateCreate,
          description: description,
          isNew: isNew,
          isPopular: isPopular,
          image: imageIRI,
        ),
      );

  @override
  Future<List<MediaModel>> getUserMedia({
    required int userId,
    required int limit,
    required int page,
  }) async {
    final media = await mediaService.getUserPhoto(
      PhotoRequestDTO(
        userId: userId,
        limit: limit,
        page: page,
      ),
    );

    final mediaList = media.data
        .map(
          (e) => e.toModel(),
        )
        .toList();

    return mediaList;
  }

  @override
  Future<void> deleteMediaObject({
    required int id,
  }) async {
    mediaService.deleteMediaObject(
      id: id,
    );
  }

  @override
  Future<void> deletePhoto({
    required int id,
  }) async {
    mediaService.deletePhoto(
      id: id,
    );
  }
}
