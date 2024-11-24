import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:flutter/material.dart';

import '../Auth/Login/login.dart';

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
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacementNamed(context, Login.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.blueBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(AppConstants.appLogo)
          ),
          Center(child: Text(AppConstants.splashTitle , style:  AppConstants.splashTitleStyle,)),
        ],
      ),
    );
  }
}
