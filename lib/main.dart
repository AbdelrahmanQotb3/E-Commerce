import 'package:e_commerce/UI/Screens/Auth/Register/register.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:flutter/material.dart';

import 'UI/Screens/Auth/Login/login.dart';
import 'UI/Screens/Splash/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        Login.routeName: (_) => Login(),
        Register.routeName : (_) => Register(),
      },
      initialRoute: Login.routeName,
    );
  }
}
