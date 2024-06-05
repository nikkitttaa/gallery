part of domain;

class UserUseCase {
  final UserRepository userRepository;
  final TokenRepository tokenRepository;

  UserUseCase({
    required this.userRepository,
    required this.tokenRepository,
  });

  Future<UserModel> getCurrentUser() async {
    final user = await userRepository.getCurrentUser();
    final myUser = await userRepository.getUserById(id: user.id);
    return myUser;
  }

  Future<void> updateUser({
    required int id,
    required String username,
    DateTime? birthday,
    required String email,
    required String phone,
    required String fullName,
    required List<String> roles,
  }) async {
    await userRepository.updateUser(
      id: id,
      username: username,
      email: email,
      phone: phone,
      birthday: birthday,
      fullName: fullName,
      roles: roles,
    );
  }

  Future<void> updatePassword({
    required int id,
    required String oldPassword,
    required String newPassword,
  }) async {
    await userRepository.updatePassword(
      id: id,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  Future<void> deleteUser({
    required int id,
  }) async {
    await userRepository.deleteUser(id: id);
  }

  Future<void> signOut() async {
    await tokenRepository.deleteAccessToken();
    await tokenRepository.deleteRefreshToken();
  }
}
