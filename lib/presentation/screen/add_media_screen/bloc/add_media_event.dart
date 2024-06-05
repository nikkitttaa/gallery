part of presentation_add_media;

@freezed
class AddMediaEvent with _$AddMediaEvent {
  const factory AddMediaEvent.addMedia({
    required String? image,
    required String name,
    required String? description,
  }) = _AddMedia;
}
