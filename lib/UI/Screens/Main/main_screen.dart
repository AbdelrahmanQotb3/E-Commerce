import 'package:e_commerce/UI/Screens/Main/Main%20Screen%20View%20Model/main_screen_state.dart';
import 'package:e_commerce/UI/Screens/Main/Main%20Screen%20View%20Model/main_screen_view_model.dart';
import 'package:e_commerce/Utilities/app_colors.dart';
import 'package:e_commerce/Utilities/app_images.dart';
import 'package:e_commerce/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "MainScreen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <MainScreenViewModel , MainScreenState>(
      bloc: viewModel,
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(
            actions: [
              Icon(
                Icons.shopping_cart,
                color: AppColors.blueBackgroundColor,
                size: 30,
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: state.tabs[state.currentSelectedTab],
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: AppColors.blueBackgroundColor),
            child: BottomNavigationBar(
              backgroundColor: AppColors.blueBackgroundColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: state.currentSelectedTab,
              onTap: (index) {
                viewModel.setNewTab(index);
              },
              items: [
                buildBottomNavigationBarItem(AppImages.homeTabIcon, state.currentSelectedTab == 0),
                buildBottomNavigationBarItem(AppImages.categoryTabIcon, state.currentSelectedTab ==1),
                buildBottomNavigationBarItem(AppImages.favouriteTabIcon, state.currentSelectedTab ==2),
                buildBottomNavigationBarItem(AppImages.profileTabIcon, state.currentSelectedTab ==3),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String assets, bool selected) {
    return BottomNavigationBarItem(
        icon: selected
            ? CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: ImageIcon(
                  AssetImage(assets),
                  size: 30,
                ),
              )
            : ImageIcon(
                AssetImage(assets),
                size: 30,
              ),
        label: "");
  }
}
