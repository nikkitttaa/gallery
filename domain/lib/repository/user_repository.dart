part of domain;

abstract class UserRepository {
  Future<UserModel> getCurrentUser();

  Future<UserModel> getUserById({
    required int id,
  });

  Future<void> updateUser({
    required int id,
    required String username,
    DateTime? birthday,
    required String email,
    required String phone,
    required String fullName,
    required List<String> roles,
  });

  Future<void> updatePassword({
    required int id,
    required String oldPassword,
    required String newPassword,
  });

  Future<void> deleteUser({
    required int id,
  });
}
