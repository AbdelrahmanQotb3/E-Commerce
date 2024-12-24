import 'package:e_commerce/Data/Utilites/shared_preference_utils.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/di.dart';
import 'package:flutter/material.dart';

import '../../../Utilities/app_colors.dart';
import '../../../Utilities/app_images.dart';
import '../Auth/Login/login.dart';
import '../Main/Home/home.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferencesUtils sharedPreferencesUtils = getIt();
      String? token = await sharedPreferencesUtils.getToken();
      if(token == null ){
        Navigator.pushReplacementNamed(context, Login.routeName);
      }
      else{
        Navigator.pushReplacementNamed(context, Home.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(AppImages.appLogo)
          ),
          Center(child: Text(AppConstants.splashTitle , style:  AppConstants.splashTitleStyle,)),
        ],
      ),
    );
  }
}
