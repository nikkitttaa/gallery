part of presentation_add_media;

class AddMediaBloc extends Bloc<AddMediaEvent, AddMediaState> {
  AddMediaBloc({required this.mediaUseCase}) : super(const AddMediaState()) {
    on<_AddMedia>(_addMedia);
  }

  final MediaUseCase mediaUseCase;

  FutureOr<void> _addMedia(
    _AddMedia event,
    Emitter<AddMediaState> emit,
  ) async {
    try {
      if (event.name == '') {
        emit(
          state.copyWith(
            status: Status.nameNull,
          ),
        );
      } else if (event.image == null) {
        emit(
          state.copyWith(
            status: Status.imageNull,
          ),
        );
      }
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );

      await mediaUseCase.addMedia(
        name: event.name,
        dateCreate: DateTime.now(),
        description: event.description,
        isNew: true,
        isPopular: false,
        image: ImageModel(
          name: event.image!,
          file: event.image,
        ),
      );

      emit(
        state.copyWith(
          status: Status.success,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: Status.failure,
        ),
      );
    }
  }
}
