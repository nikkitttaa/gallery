part of presentation_new_photo;

@freezed
class NewPhotoEvent with _$NewPhotoEvent {
  const factory NewPhotoEvent.getPhoto({
    @Default(false) bool clearPhoto,
    String? name,
    int? userId,
    required int limit,
  }) = _GetPhoto;
}
