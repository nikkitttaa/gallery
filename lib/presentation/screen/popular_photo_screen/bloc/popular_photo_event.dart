part of presentation_popular_photo;

@freezed
class PopularPhotoEvent with _$PopularPhotoEvent {
  const factory PopularPhotoEvent.getPhoto({
    @Default(false) bool clearPhoto,
    String? name,
    required int limit,
  }) = _GetPhoto;
}
