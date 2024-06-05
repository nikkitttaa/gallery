part of data;

@RestApi(baseUrl: AppConst.baseUrl)
abstract class UserServices {
  factory UserServices(Dio dio) = _UserServices;

  @GET(AppConst.currentUserUrl)
  Future<UserDto> getCurrentUser();

  @GET(AppConst.userIdUrl)
  Future<UserDto> getUserById({
    @Path('id') required int id,
  });

  @PUT(AppConst.userIdUrl)
  Future<UserDto> updateUser(
    @Path('id') int id,
    @Body() UpdateUserRequest body,
  );

  @PUT(AppConst.updatePasswordUrl)
  Future<UpdatePasswordDTO> updatePassword(
    @Path('id') int id,
    @Body() UpdatePasswordRequest body,
  );

  @DELETE(AppConst.userIdUrl)
  Future<void> deleteUser({
    @Path('id') required int id,
  });
}
