part of data;

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({required this.service});

  final UserServices service;

  @override
  Future<UserModel> getCurrentUser() async {
    final currentUser = await service.getCurrentUser();

    final currentUserModel = currentUser.toModel();
    return currentUserModel;
  }

  @override
  Future<UserModel> getUserById({
    required int id,
  }) async {
    final user = await service.getUserById(id: id);

    final currentUser = user.toModel();
    return currentUser;
  }

  @override
  Future<void> updateUser({
    required int id,
    required String username,
    DateTime? birthday,
    required String email,
    required String phone,
    required String fullName,
    required List<String> roles,
  }) async =>
      await service.updateUser(
        id,
        UpdateUserRequest(
          username: username,
          email: email,
          phone: phone,
          birthday: birthday,
          fullName: fullName,
          roles: roles,
        ),
      );

  @override
  Future<void> updatePassword({
    required int id,
    required String oldPassword,
    required String newPassword,
  }) async =>
      service.updatePassword(
        id,
        UpdatePasswordRequest(
          oldPassword: oldPassword,
          newPassword: newPassword,
        ),
      );

  @override
  Future<void> deleteUser({
    required int id,
  }) async {
    await service.deleteUser(id: id);
  }
}
