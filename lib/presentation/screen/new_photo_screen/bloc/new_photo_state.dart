part of presentation_new_photo;

enum Status {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isLoaded => this == Status.loaded;

  bool get isError => this == Status.error;
}

@freezed
class NewPhotoState with _$NewPhotoState {
  const factory NewPhotoState({
    @Default(Status.initial) Status status,
    @Default(true) bool isFirstLoading,
    @Default([]) List photoList,
    @Default(false) bool hasReachedMax,
  }) = _NewPhotoState;
}
