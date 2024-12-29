import 'package:e_commerce/UI/Screens/Main/Categories/categories_tab.dart';
import 'package:e_commerce/UI/Screens/Main/Fav/favourite_tab.dart';
import 'package:e_commerce/UI/Screens/Main/Home/home_tab.dart';
import 'package:e_commerce/UI/Screens/Main/Profile/profile_tab.dart';
import 'package:flutter/material.dart';

class MainScreenState {
  int currentSelectedTab;
  static const List<Widget> defaultTabs = [
    HomeTab(),
    CategoriesTab(),
    FavouriteTab(),
    ProfileTab()
  ];
  List<Widget> tabs;

  MainScreenState({this.currentSelectedTab = 0, this.tabs = defaultTabs});

  MainScreenState copyWith({
    int? currentSelectedTab,
    List<Widget>? tabs,
  }) {
    return MainScreenState(
      currentSelectedTab: currentSelectedTab ?? this.currentSelectedTab,
      tabs: tabs ?? this.tabs,
    );
  }
}
