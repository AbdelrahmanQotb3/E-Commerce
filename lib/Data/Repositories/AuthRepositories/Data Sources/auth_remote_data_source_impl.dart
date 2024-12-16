import 'dart:convert';

import 'package:e_commerce/Data/Repositories/AuthRepositories/Data%20Sources/auth-remote_data_source.dart';
import 'package:e_commerce/Data/Utilites/shared_preference_utils.dart';
import 'package:e_commerce/Utilities/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../../Model/AuthResponse.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  SharedPreferencesUtils sharedPreferencesUtils;
  AuthRemoteDataSourceImpl(this.sharedPreferencesUtils);
  @override
  Future login(String email, String password) async {
    Uri url = Uri.parse(EndPoints.login);
    final body = {"email": email, "password": password};
    Response apiRespones = await post(url, body: body);
    AuthResponse authResponse =
        AuthResponse.fromJson(jsonDecode(apiRespones.body));
    if (apiRespones.statusCode >= 200 && apiRespones.statusCode < 300 && authResponse.token != null) {
      sharedPreferencesUtils.saveToken(authResponse.token);
      return;
    } else {
      throw authResponse.message;
    }
  }

  @override
  Future Register(
      {required userName,
      required email,
      required mobileNumber,
      required password,
      required rePassword}) async {
    Uri url = Uri.parse(EndPoints.signUp);
    final body = {
      "name": userName,
      "email":email,
      "password":password,
      "rePassword":password,
      "phone":mobileNumber
    };
    print("register body : ${body}");
    Response apiRespones = await post(url, body: body);
    AuthResponse authResponse =
    AuthResponse.fromJson(jsonDecode(apiRespones.body));
    if (apiRespones.statusCode >= 200 && apiRespones.statusCode < 300) {
      sharedPreferencesUtils.saveToken(authResponse.token);
      return;
    } else {
      throw authResponse.message;
    }
  }
}
