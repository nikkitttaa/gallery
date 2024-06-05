part of presentation_full_media_screen;

class FullMediaBloc extends Bloc<FullMediaEvent, FullMediaState> {
  FullMediaBloc({required this.mediaUseCase}) : super(const FullMediaState()) {
    on<_GetMedia>(_getMedia);
  }

  final MediaUseCase mediaUseCase;

  FutureOr<void> _getMedia(
    event,
    Emitter<FullMediaState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: MediaStatus.loading,
        ),
      );

      final media = await mediaUseCase.getFullMedia(id: event.mediaId);

      emit(
        state.copyWith(
          status: MediaStatus.loaded,
          media: media,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: MediaStatus.error,
        ),
      );
    }
  }
}
