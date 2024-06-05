part of data;

@RestApi(baseUrl: AppConst.baseUrl)
abstract class MediaService {
  factory MediaService(Dio dio) = _MediaService;

  @GET(AppConst.photosUrl)
  Future<WrapperDTO<MediaDTO>> getPhoto(
    @Queries() PhotoRequestDTO request,
  );

  @GET('${AppConst.photosUrl}/{id}')
  Future<MediaDTO> getFullMedia({
    @Path('id') required int id,
  });

  @POST(AppConst.mediaObjectUrl)
  Future<ImageDTO> addMedia({
    @Part(name: 'file', fileName: 'fileName.jpeg') required File file,
  });

  @POST(AppConst.photosUrl)
  Future<void> addPhotos(
    @Body() PhotosRequest body,
  );

  @GET(AppConst.photosUrl)
  Future<WrapperDTO<MediaDTO>> getUserPhoto(
    @Queries() PhotoRequestDTO request,
  );

  @DELETE('${AppConst.mediaObjectUrl}/{id}')
  Future<void> deleteMediaObject({
    @Path('id') required int id,
  });

  @DELETE('${AppConst.photosUrl}/{id}')
  Future<void> deletePhoto({
    @Path('id') required int id,
  });
}
