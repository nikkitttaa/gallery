part of presentation_profile;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required this.mediaUseCase,
    required this.userUseCase,
  }) : super(const ProfileState()) {
    on<_LoadUser>(_onLoadUser);
    on<_DeleteMedia>(_onDeleteMedia);
  }

  final UserUseCase userUseCase;
  final MediaUseCase mediaUseCase;

  FutureOr<void> _onLoadUser(
    _LoadUser event,
    Emitter<ProfileState> emit,
  ) async {

    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    final user = await userUseCase.getCurrentUser();

    emit(
      state.copyWith(
        status: Status.loaded,
        userInfo: user,
      ),
    );
  }

  FutureOr<void> _onDeleteMedia(
    _DeleteMedia event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await mediaUseCase.deleteMedia(
        mediaId: event.mediaObjectId,
        photoId: event.photoId,
      );

      emit(
        state.copyWith(
          status: Status.deleteSuccess,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: Status.deleteFailure,
        ),
      );
    }
  }
}
