part of domain;

class MediaUseCase {
  final MediaRepository mediaRepository;
  final UserRepository userRepository;

  MediaUseCase({
    required this.mediaRepository,
    required this.userRepository,
  });

  Future<List<MediaModel>> getMedia({
    required bool isNew,
    required int limit,
    required int page,
    String? name,
    int? userId,
  }) async =>
      mediaRepository.getPhoto(
        isNew: isNew,
        limit: limit,
        page: page,
        name: name,
        userId: userId,
      );

  Future<List<MediaModel>> searchMedia({
    required String name,
    required bool isNew,
    required int limit,
    required int page,
  }) async {
    final photoList = await mediaRepository.getPhoto(
      name: name,
      isNew: isNew,
      limit: limit,
      page: page,
    );

    return photoList;
  }

  Future<MediaModel> getFullMedia({
    required int id,
  }) async {
    final media = await mediaRepository.getFullMedia(id: id);
    final List<String> parts = media.userPath!.split("/");

    final int userId = int.parse(parts.last);
    final authorMedia = await userRepository.getUserById(id: userId);

    return MediaModel(
      id: media.id,
      name: media.name,
      dateCreate: media.dateCreate,
      description: media.description,
      isNew: media.isNew,
      isPopular: media.isPopular,
      imageData: media.imageData,
      userPath: media.userPath,
      authorMedia: authorMedia,
    );
  }

  Future<void> addMedia({
    required String name,
    required DateTime dateCreate,
    required String? description,
    required bool isNew,
    required bool isPopular,
    required image,
  }) async {
    final List<String> parts = image.file!.split("/");
    final String imgName = parts.last;

    final mediaObject = await mediaRepository.addMedia(
      file: File(image.file!),
      name: imgName,
    );

    await mediaRepository.addPhotos(
      name: name,
      dateCreate: dateCreate,
      description: description,
      isNew: isNew,
      isPopular: isPopular,
      imageIRI: '/api/media_objects/${mediaObject.id}',
    );
  }

  Future<List<MediaModel>> getUserMedia({
    required int userId,
    required int limit,
    required int page,
  }) async {
    final photoList = await mediaRepository.getUserMedia(
      userId: userId,
      limit: limit,
      page: page,
    );

    return photoList;
  }

  Future<void> deleteMedia({
    required int mediaId,
    required int photoId,
  }) async {
    await mediaRepository.deleteMediaObject(
      id: mediaId,
    );

    await mediaRepository.deletePhoto(
      id: photoId,
    );
  }
}
