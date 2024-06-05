part of presentation_full_media_screen;

enum MediaStatus {
  loading,
  loaded,
  error;

  bool get isLoading => this == MediaStatus.loading;

  bool get isLoaded => this == MediaStatus.loaded;

  bool get isError => this == MediaStatus.error;
}

@freezed
class FullMediaState with _$FullMediaState {
  const factory FullMediaState({
    @Default(MediaStatus.loading) MediaStatus status,
    MediaModel? media,
  }) = _FullMediaState;
}
