part of presentation_popular_photo;

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
class PopularPhotoState with _$PopularPhotoState {
  const factory PopularPhotoState({
    @Default(Status.initial) Status status,
    @Default(true) bool isFirstLoading,
    @Default([]) List photoList,
    @Default(false) bool hasReachedMax,
  }) = _PopularPhotoState;
}
