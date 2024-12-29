import 'package:flutter/material.dart';

abstract class AppConstants{
  static String appTitle = "E-Commerce";
  static String splashTitle = "E-Commerce";
  static TextStyle splashTitleStyle = TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
  static TextStyle loginTextFieldTilte = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600

  );
  static TextStyle loginScreenTexts = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold

  );
  static TextStyle dialogText = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.bold
  );
  static String defaultMessageError = "something went wrong, please try again later ";
  static TextStyle homeTabCategoriesText = TextStyle(
    color: Color(0xff06004F),
    fontSize: 20,
    fontWeight: FontWeight.w500
  );
}