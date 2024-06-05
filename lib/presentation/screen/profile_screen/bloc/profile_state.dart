part of presentation_profile;

enum Status {
  initial,
  loading,
  loaded,
  error,
  deleteSuccess,
  deleteFailure;

  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isLoaded => this == Status.loaded;

  bool get isError => this == Status.error;

  bool get isDeleteSuccess => this == Status.deleteSuccess;

  bool get isDeleteFailure => this == Status.deleteFailure;
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(Status.initial) Status status,
    UserModel? userInfo,
  }) = _ProfileState;
}
