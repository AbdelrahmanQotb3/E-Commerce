abstract class AuthRemoteDataSource {
  Future Login(String email, String password);

  Future Register(
      {required userName,
      required email,
      required mobileNumber,
      required password,
      required rePassword});
}
