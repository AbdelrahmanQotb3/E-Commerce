abstract class AuthRemoteDataSource {
  Future login(String email, String password);

  Future Register(
      {required userName,
      required email,
      required mobileNumber,
      required password,
      required rePassword});
}
