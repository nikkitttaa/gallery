part of presentation_profile;

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadUser({
    @Default(false) bool clearPhoto,
  }) = _LoadUser;

  const factory ProfileEvent.deleteMedia({
    required int mediaObjectId,
    required int photoId,
  }) = _DeleteMedia;
}
