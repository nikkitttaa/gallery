part of presentation_popular_photo;

class PopularPhotoBloc extends Bloc<PopularPhotoEvent, PopularPhotoState> {
  PopularPhotoBloc({required this.mediaUseCase}) : super(const PopularPhotoState()) {
    on<_GetPhoto>(_getPhoto);
  }

  final MediaUseCase mediaUseCase;

  FutureOr<void> _getPhoto(
    _GetPhoto event,
    Emitter<PopularPhotoState> emit,
  ) async {
    if ((state.hasReachedMax || state.status == Status.loading) && !event.clearPhoto) return;
    int currentPage = event.clearPhoto ? 1 : 1 + (state.photoList.length ~/ event.limit);

    emit(
      state.copyWith(
        status: Status.loading,
        isFirstLoading: currentPage == 1,
        photoList: event.clearPhoto ? [] : state.photoList,
        hasReachedMax: false,
      ),
    );

    final photo = await mediaUseCase.getMedia(
      isNew: false,
      limit: event.limit,
      page: currentPage,
      name: event.name,
    );

    List<MediaModel> updatedPhotoList = event.clearPhoto
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
