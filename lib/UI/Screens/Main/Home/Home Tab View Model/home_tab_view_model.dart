import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:e_commerce/Data/Model/CategoriesResponse.dart';
import 'package:e_commerce/Data/Model/ProductsRespone.dart';
import 'package:e_commerce/Data/Repositories/MainScreenRepositories/main_screen_repositories.dart';
import 'package:e_commerce/UI/Screens/Main/Home/Home%20Tab%20View%20Model/home_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState>{
  MainScreenRepositories mainScreenRepositories;
  HomeTabViewModel(this.mainScreenRepositories) : super(HomeTabState());

  Future<void> loadCategoriesTab() async {
    emit(state.copyWith(categoriesApi: BaseScreenState.loading));
    try{
      List<CategoriesData> categories = await mainScreenRepositories.getCategories();
      emit(state.copyWith(categoriesApi: BaseScreenState.success , categories: categories));
      print("state Successfully emitted ");
    }catch(e){
      emit(state.copyWith(categoriesApi:  BaseScreenState.failure , errorMessage: e.toString()));
      print("State failed ");
    }
  }

  Future<void> loadProductsTab() async {
    emit(state.copyWith(productsApi: BaseScreenState.loading));
    try{
      List<ProductsData> products = await mainScreenRepositories.getProducts();
      emit(state.copyWith(productsApi: BaseScreenState.success , products: products));
    }catch(exception){
      emit(state.copyWith(productsApi: BaseScreenState.failure , errorMessage: exception.toString()));
    }
  }

}