part of presentation_add_media;

enum Status {
  failure,
  initial,
  success,
  loading,
  imageNull,
  nameNull,
}

@freezed
class AddMediaState with _$AddMediaState {
  const factory AddMediaState({
    @Default(Status.initial) Status status,
  }) = _AddMediaState;
}
