import 'package:e_commerce/Data/Repositories/AuthRepositories/Data%20Sources/auth-remote_data_source.dart';
import 'package:e_commerce/Data/Repositories/AuthRepositories/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{
  InternetConnectionCheckerPlus connectionChecker;
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.connectionChecker ,this.authRemoteDataSource);
  @override
  Future Login(String userName, String password) async {
    if(await connectionChecker.hasConnection ){
       await authRemoteDataSource.login(userName, password);
    }else{
      throw "Check your internet connection";
    }
  }

  @override
  Future Register ({required userName, required email, required mobileNumber, required password, required rePassword}) async {
    if(await connectionChecker.hasConnection){
      await authRemoteDataSource.Register(userName: userName, email: email, mobileNumber: mobileNumber, password: password, rePassword: rePassword);
    }else{
      throw "Check your internet connection";
    }
  }

}