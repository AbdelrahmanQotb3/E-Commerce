import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Utilities/custome_textField_decoration.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String routeName = "LoginScreen";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.blueBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch  ,
            children: [
              Image.asset(AppConstants.appLogo , height: MediaQuery.of(context).size.height * 0.3, width: MediaQuery.of(context).size.width * 0.3,),
              Text("Welcome Back To E-Commerce",style: AppConstants.loginScreenTexts,),
              SizedBox(height: 5,),
              Text("Please sign in with your email", style: AppConstants.loginTextFieldTilte.copyWith(fontSize: 16),),
              SizedBox(height: 15,),
              Text("User Name" , style: AppConstants.loginTextFieldTilte,),
              SizedBox(height: 12,),
              CustomTextfieldDecoration(textFieldTitle: "enter your name"),
              SizedBox(height: 20,),
              Text("Password", style: AppConstants.loginTextFieldTilte,),
              SizedBox(height: 12,),
              CustomTextfieldDecoration(textFieldTitle: "enter your password"),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot password" , style: AppConstants.loginScreenTexts.copyWith(fontSize: 20),textAlign: TextAlign.end,),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Login" , style: AppConstants.loginTextFieldTilte.copyWith(color: AppConstants.blueBackgroundColor),)),
              SizedBox(height: 15,),
              Text("Don't have an account ? Create Account" ,style: AppConstants.loginTextFieldTilte.copyWith(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
