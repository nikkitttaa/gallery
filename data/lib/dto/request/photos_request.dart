part of data;

@freezed
class PhotosRequest with _$PhotosRequest {
  const factory PhotosRequest({
    required String name,
    required DateTime dateCreate,
    required String? description,
    @JsonKey(name: 'new') required bool isNew,
    @JsonKey(name: 'popular') required bool isPopular,
    required String image,
  }) = _PhotosRequest;

  factory PhotosRequest.fromJson(Map<String, dynamic> json) => _$PhotosRequestFromJson(json);
}
