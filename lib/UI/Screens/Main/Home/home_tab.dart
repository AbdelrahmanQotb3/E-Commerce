import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:e_commerce/Data/Model/CategoriesResponse.dart';
import 'package:e_commerce/UI/Screens/Main/Home/Home%20Tab%20View%20Model/home_tab_state.dart';
import 'package:e_commerce/UI/Screens/Main/Home/Home%20Tab%20View%20Model/home_tab_view_model.dart';
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
                  child: appError(error: state.errorMessage)
                );
              } else if (state.categoriesApi == BaseScreenState.success) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: buildCategoriesList(state.categories!),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child:  LoadingView()
                );
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
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
          child: Image.network(categoriesData.image , fit: BoxFit.fill, height: 80, width: 80,),
        ),
        Spacer(),
        Text(
          categoriesData.name,
          style: AppConstants.homeTabCategoriesText.copyWith(fontSize: 15),
        )
      ],
    );
  }



  LoadingView() {
    return Center(child: CircularProgressIndicator());
  }
}
