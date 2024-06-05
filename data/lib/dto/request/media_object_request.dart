part of data;

@freezed
class MediaObjectRequest with _$MediaObjectRequest {
  const factory MediaObjectRequest({
    required String file,
    required String name,
  }) = _MediaObjectRequest;

  factory MediaObjectRequest.fromJson(Map<String, dynamic> json) => _$MediaObjectRequestFromJson(json);
}
