import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:e_commerce/Data/Model/CategoriesResponse.dart';
import 'package:e_commerce/Data/Model/ProductsRespone.dart';
import 'package:e_commerce/Utilities/app_images.dart';

class HomeTabState {
  static const List<String> defaultAds = [
    AppImages.adImage,
    AppImages.adImage,
    AppImages.adImage
  ];

  List<String>? ads;
  List<CategoriesData>? categories;
  List<ProductsData>? products;
  String errorMessage;
  BaseScreenState categoriesApi;
  BaseScreenState productsApi;

  HomeTabState({
    this.ads = defaultAds,
    this.categories,
    this.products,
    this.errorMessage = "",
    this.categoriesApi = BaseScreenState.loading,
    this.productsApi = BaseScreenState.loading
  });

  // CopyWith method for HomeTabState
  HomeTabState copyWith({
    List<String>? ads,
    List<CategoriesData>? categories,
    List<ProductsData>? products,
    String? errorMessage,
    BaseScreenState? categoriesApi,
    BaseScreenState? productsApi,
  }) {
    return HomeTabState(
      ads: ads ?? this.ads,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      categoriesApi: categoriesApi ?? this.categoriesApi,
      productsApi: productsApi ?? this.productsApi
    );
  }
}


