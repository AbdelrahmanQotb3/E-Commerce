import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:e_commerce/Data/Model/CategoriesResponse.dart';
import 'package:e_commerce/Data/Model/ProductsRespone.dart';
import 'package:e_commerce/UI/Screens/Main/Home/Home%20Tab%20View%20Model/home_tab_state.dart';
import 'package:e_commerce/UI/Screens/Main/Home/Home%20Tab%20View%20Model/home_tab_view_model.dart';
import 'package:e_commerce/Utilities/app_colors.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Utilities/app_error.dart';
import 'package:e_commerce/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = getIt();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadCategoriesTab();
    viewModel.loadProductsTab();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          buildAdSlider(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                "Categories",
                style: AppConstants.homeTabCategoriesText,
              ),
              Spacer(),
              Text(
                "view all",
                style: AppConstants.homeTabCategoriesText
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              )
            ],
          ),
          BlocBuilder<HomeTabViewModel, HomeTabState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state.categoriesApi == BaseScreenState.failure) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: appError(error: state.errorMessage));
              } else if (state.categoriesApi == BaseScreenState.success) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: buildCategoriesList(state.categories!),
                );
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: LoadingView());
              }
            },
          ),
          Row(
            children: [
              Text(
                "Home Appliance",
                style: AppConstants.homeTabCategoriesText,
              ),
            ],
          ),
          BlocBuilder<HomeTabViewModel, HomeTabState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state.productsApi == BaseScreenState.success) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: buildProductsList(state.products!),
                );
              } else if (state.productsApi == BaseScreenState.loading) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: LoadingView());
              } else {
                return appError(error: state.errorMessage);
              }
            },
          )
        ],
      ),
    );
  }

  buildAdSlider() {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
      bloc: viewModel,
      builder: (context, state) {
        return CarouselSlider(
          items: state.ads
              ?.map((ad) => Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(9)),
                  child: Image.asset(
                    ad,
                    fit: BoxFit.fill,
                  )))
              .toList(),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.2,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }

  Widget buildCategoriesList(List<CategoriesData> categories) {
    return GridView.builder(
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryItem(categoriesData: categories[index]);
        });
  }

  Widget CategoryItem({required CategoriesData categoriesData}) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            categoriesData.image,
            fit: BoxFit.fill,
            height: 80,
            width: 80,
          ),
        ),
        Spacer(),
        Text(
          categoriesData.name,
          style: AppConstants.homeTabCategoriesText.copyWith(fontSize: 15),
        )
      ],
    );
  }

  Widget LoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildProductsList(List<ProductsData> products) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return ProductItem(productsData: products[index]);
        });
  }

  Widget ProductItem({required ProductsData productsData}) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(
            color: Colors.lightBlue, style: BorderStyle.solid, width: 0.5),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Stack(alignment: Alignment.topRight, children: [
            Image.network(
              productsData.imageCover,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite_sharp,
                  color: AppColors.blueBackgroundColor,
                ),
              ],
            )
          ]),
        ),
        
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  productsData.title,
                  style: AppConstants.dialogText.copyWith(fontSize: 15),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "Review (${productsData.ratingsAverage})",
                    style: AppConstants.dialogText.copyWith(fontSize: 15),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Text(
                "EGP ${productsData.price}",
                style: AppConstants.dialogText.copyWith(fontSize: 15),
              ),
              Spacer(),
              FloatingActionButton.small(
                backgroundColor: AppColors.blueBackgroundColor,
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          )
        ]),
      ]),
    );
  }
}
