import 'dart:convert';

import 'package:e_commerce/Data/Model/auth_response.dart';
import 'package:e_commerce/Data/Repositories/AuthRepositories/Data%20Sources/auth-remote_data_source.dart';
import 'package:e_commerce/Utilities/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future Login(String email, String password) async {
    Uri url = Uri.parse(EndPoints.login);
    final body = {"email": email, "password": password};
    Response apiRespones = await post(url, body: body);
    AuthResponse authResponse =
        AuthResponse.fromJson(jsonDecode(apiRespones.body));
    if (apiRespones.statusCode >= 200 && apiRespones.statusCode < 300) {
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
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": mobileNumber
    };
    Response apiResponse = await post(url , body: body);
    AuthResponse authResponse = AuthResponse.fromJson(jsonDecode(apiResponse.body));
    if(apiResponse.statusCode >= 200 && apiResponse.statusCode < 300){
      return;
    }
    else{
      throw authResponse.message;
    }
  }
}
