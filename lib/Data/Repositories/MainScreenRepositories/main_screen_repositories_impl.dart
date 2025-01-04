import 'dart:convert';
import 'package:e_commerce/Data/Model/CategoriesResponse.dart';
import 'package:e_commerce/Data/Model/ProductsRespone.dart';
import 'package:e_commerce/Data/Repositories/MainScreenRepositories/main_screen_repositories.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Utilities/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

@Injectable(as: MainScreenRepositories)
class MainScreenRepositoriesImpl extends MainScreenRepositories{
  InternetConnectionCheckerPlus internetConnectionCheckerPlus;
  MainScreenRepositoriesImpl(this.internetConnectionCheckerPlus);

  @override
  Future getCategories() async {
    if(await internetConnectionCheckerPlus.hasConnection){
      Response serverResponse = await get(Uri.parse(EndPoints.getCategories));
      CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 && categoriesResponse.data != null){
        return categoriesResponse.data;
      }else{
        throw AppConstants.defaultMessageError;
      }
    }else{
      throw AppConstants.internetErrorMessage;
    }
  }

  @override
  Future getProducts() async {
    if(await internetConnectionCheckerPlus.hasConnection){
      Response serverResponse = await get(Uri.parse(EndPoints.getProducts));
      ProductsResponse productsResponse = ProductsResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
        return productsResponse.data;
      }else{
        throw AppConstants.defaultMessageError;
      }

    }else{
      throw AppConstants.internetErrorMessage;
    }
  }

}