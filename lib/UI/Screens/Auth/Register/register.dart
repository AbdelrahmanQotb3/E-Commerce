import 'package:e_commerce/Base/base_state.dart';
import 'package:e_commerce/Base/enums/base_screen_state.dart';
import 'package:e_commerce/UI/Screens/Auth/Login/login.dart';
import 'package:e_commerce/UI/Screens/Auth/Register/cubit/register_view_model.dart';
import 'package:e_commerce/Utilities/dialog_util.dart';
import 'package:e_commerce/Widgets/add_logo.dart';
import 'package:e_commerce/Utilities/app_colors.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Widgets/custome_textField_decoration.dart';
import 'package:e_commerce/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  static String routeName = "Register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  RegisterViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {

    return BlocListener<RegisterViewModel , BaseState>(
      bloc: viewModel,
      listener: (context , state){
        if(state.state == BaseScreenState.loading){
          DialogUtil.showLoading(context);
        }
        if(state.state == BaseScreenState.success){
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Login.routeName);
        }
        if(state.state == BaseScreenState.failure){
          Navigator.pop(context);
          DialogUtil.showError(context, "Register Error");
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blueBackgroundColor,
        body: Form(
          key: viewModel.formKey,
          child: Padding(
              padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AddLogo(),
                  Text("Full Name" , style: AppConstants.loginTextFieldTilte,),
                  SizedBox(height: 12,),
                  CustomTextFieldDecoration(
                    textFieldTitle: "enter your full name.",
                    Controller: viewModel.nameController,
                    Validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return "Please enter a valid User Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12,),
                  Text("Mobile Number " , style: AppConstants.loginTextFieldTilte,),
                  SizedBox(height: 12,),
                  CustomTextFieldDecoration(
                    textFieldTitle: "enter your mobile no." ,
                    Controller: viewModel.mobileNumberController,
                    Validator: (text){
                      if(text == null || text.trim().isEmpty || text.length != 11){
                        return "Please enter a valid Mobile Number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12,),
                  Text("E-mail address" , style: AppConstants.loginTextFieldTilte,),
                  SizedBox(height: 12,),
                  CustomTextFieldDecoration(
                    textFieldTitle: "enter your email address." ,
                    Controller: viewModel.emailController,
                    Validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return "Please enter a valid Email";
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if(!emailValid){
                        return "Email Format is not allowed";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12,),
                  Text("Password" , style: AppConstants.loginTextFieldTilte,),
                  SizedBox(height: 12,),
                  CustomTextFieldDecoration(
                    textFieldTitle: "enter your password." ,
                    Controller: viewModel.passwordController,
                    Validator: (text){
                      if(text == null || text.length < 6){
                        return "Please enter a valid password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12,),
                  Text("Confirm Password" , style: AppConstants.loginTextFieldTilte,),
                  SizedBox(height: 12,),
                  CustomTextFieldDecoration(
                      textFieldTitle: "confirm password",
                      Controller: viewModel.confirmPasswordController,
                      Validator: (text){
                        if(text == null || text.trim().isEmpty || text != viewModel.passwordController.text){
                          return "Password doesn't match";
                        }
                      }
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    viewModel.Register();
                  }, child: Text("Sign Up " , style: AppConstants.loginTextFieldTilte.copyWith(color: AppColors.blueBackgroundColor),)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}


