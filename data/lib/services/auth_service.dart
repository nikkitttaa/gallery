part of data;

@RestApi(baseUrl: AppConst.baseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio) = _AuthServices;

  @POST(AppConst.registerUrl)
  Future<UserDto> signUp(@Body() RegistrationRequest body);

  @GET(AppConst.loginUrl)
  Future<TokenDTO> signIn({
    @Query('client_id') required String clientId,
    @Query('grant_type') required String grantType,
    @Query('username') required String username,
    @Query('password') required String password,
    @Query('client_secret') required String clientSecret,
  });

  @GET(AppConst.refreshUrl)
  Future<TokenDTO> refreshToken({
    @Query('client_id') required String clientId,
    @Query('grant_type') required String grantType,
    @Query('refresh_token') required String refreshToken,
    @Query('client_secret') required String clientSecret,
  });
}
