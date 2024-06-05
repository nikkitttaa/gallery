part of presentation_new_photo;

class NewPhotoBloc extends Bloc<NewPhotoEvent, NewPhotoState> {
  NewPhotoBloc({required this.mediaUseCase}) : super(const NewPhotoState()) {
    on<_GetPhoto>(_getPhoto);
  }

  final MediaUseCase mediaUseCase;

  FutureOr<void> _getPhoto(
    _GetPhoto event,
    Emitter<NewPhotoState> emit,
  ) async {
    if ((state.hasReachedMax || state.status == Status.loading) && !event.clearPhoto) return;

    var currentPage = event.clearPhoto ? 1 : 1 + (state.photoList.length ~/ event.limit);

    emit(
      state.copyWith(
        status: Status.loading,
        isFirstLoading: currentPage == 1,
      ),
    );

    final photo = await mediaUseCase.getMedia(
      isNew: true,
      page: currentPage,
      limit: event.limit,
      userId: event.userId,
      name: event.name,
    );

    final updatedPhotoList = event.clearPhoto
        ? photo
        : [
            ...state.photoList,
            ...photo,
          ];

    emit(
      state.copyWith(
        status: Status.loaded,
        photoList: updatedPhotoList,
        hasReachedMax: photo.length < event.limit,
      ),
    );
  }
}
