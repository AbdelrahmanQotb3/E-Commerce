import 'package:e_commerce/UI/Screens/Auth/Register/register.dart';
import 'package:e_commerce/Utilities/add_logo.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Utilities/custome_textField_decoration.dart';
import 'package:flutter/material.dart';

import '../../Home/home.dart';

class Login extends StatefulWidget {
  static String routeName = "LoginScreen";
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.blueBackgroundColor,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch  ,
              children: [
                AddLogo(),
                Text("Welcome Back To E-Commerce",style: AppConstants.loginScreenTexts,),
                SizedBox(height: 5,),
                Text("Please sign in with your email", style: AppConstants.loginTextFieldTilte.copyWith(fontSize: 16),),
                SizedBox(height: 15,),
                Text("User Name" , style: AppConstants.loginTextFieldTilte,),
                SizedBox(height: 12,),
                CustomTextFieldDecoration(
                  textFieldTitle: "enter your name" ,
                  Controller: nameController,
                  Validator: (text){
                    if(text == null || text.trim().isEmpty){
                      return "Please enter a valid User Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                Text("Password", style: AppConstants.loginTextFieldTilte,),
                SizedBox(height: 12,),
                CustomTextFieldDecoration(
                  textFieldTitle: "enter your password" ,
                  Controller: passwordController,
                  Validator: (text){
                    if(text == null || text.length < 6){
                      return "Please enter a valid password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot password" , style: AppConstants.loginScreenTexts.copyWith(fontSize: 20),textAlign: TextAlign.end,),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Validation();
                }, child: Text("Login" , style: AppConstants.loginTextFieldTilte.copyWith(color: AppConstants.blueBackgroundColor),)),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text("Don't have an account ?" ,style: AppConstants.loginTextFieldTilte.copyWith(fontSize: 16)),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Register.routeName);
                      },
                      child:Text("Create Account " ,style: AppConstants.loginTextFieldTilte.copyWith(fontSize: 16)),

                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Validation() {
    if(!formKey.currentState!.validate()){
      return;
    }else{
      Navigator.pushReplacementNamed(context, Home.routeName);
    }
  }
}


