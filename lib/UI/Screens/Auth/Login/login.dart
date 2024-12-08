import 'package:e_commerce/Base/base_state.dart';
import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:e_commerce/UI/Screens/Auth/Login/cubit/login_view_model.dart';
import 'package:e_commerce/UI/Screens/Auth/Register/register.dart';
import 'package:e_commerce/UI/Screens/Home/home.dart';
import 'package:e_commerce/Utilities/dialog_util.dart';
import 'package:e_commerce/Widgets/add_logo.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Widgets/custome_textField_decoration.dart';
import 'package:e_commerce/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Utilities/app_colors.dart';

class Login extends StatefulWidget {
  static String routeName = "LoginScreen";

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel , BaseState>(
      bloc: viewModel,
      listener: (context , state){
        if(state.state == BaseScreenState.loading){
          DialogUtil.showLoading(context);
        }else if(state.state == BaseScreenState.failure){
          DialogUtil.showError(context, state.errorMessage!);
        }else if(state.state == BaseScreenState.success){
          Navigator.pushReplacementNamed(context, Home.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blueBackgroundColor,
        body: Form(
          key: viewModel.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AddLogo(),
                  Text(
                    "Welcome Back To E-Commerce",
                    style: AppConstants.loginScreenTexts,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Please sign in with your email",
                    style:
                        AppConstants.loginTextFieldTilte.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "User Name",
                    style: AppConstants.loginTextFieldTilte,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFieldDecoration(
                    textFieldTitle: "enter your name",
                    Controller: viewModel.nameController,
                    Validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "Please enter a valid User Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: AppConstants.loginTextFieldTilte,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFieldDecoration(
                    textFieldTitle: "enter your password",
                    Controller: viewModel.passwordController,
                    Validator: (text) {
                      if (text == null || text.length < 6) {
                        return "Please enter a valid password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password",
                        style:
                            AppConstants.loginScreenTexts.copyWith(fontSize: 20),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.Login();
                      },
                      child: Text(
                        "Login",
                        style: AppConstants.loginTextFieldTilte
                            .copyWith(color: AppColors.blueBackgroundColor),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text("Don't have an account ?",
                          style: AppConstants.loginTextFieldTilte
                              .copyWith(fontSize: 16)),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Register.routeName);
                        },
                        child: Text("Create Account ",
                            style: AppConstants.loginTextFieldTilte
                                .copyWith(fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
