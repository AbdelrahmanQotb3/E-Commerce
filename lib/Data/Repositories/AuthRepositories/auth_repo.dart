abstract class AuthRepository {
  Future Login(String userName, String password);

  Future Register(
      {required userName,
      required email,
      required mobileNumber,
      required password});
}
