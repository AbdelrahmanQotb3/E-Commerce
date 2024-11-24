import 'package:e_commerce/Utilities/add_logo.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Utilities/custome_textField_decoration.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static String routeName = "Register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.blueBackgroundColor,
      body: Padding(
          padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AddLogo(),
              Text("Full Name" , style: AppConstants.loginTextFieldTilte,),
              SizedBox(height: 12,),
              CustomTextfieldDecoration(textFieldTitle: "enter your full name."),
              SizedBox(height: 12,),
              Text("Mobile Number " , style: AppConstants.loginTextFieldTilte,),
              SizedBox(height: 12,),
              CustomTextfieldDecoration(textFieldTitle: "enter your mobile no."),
              SizedBox(height: 12,),
              Text("E-mail address" , style: AppConstants.loginTextFieldTilte,),
              SizedBox(height: 12,),
              CustomTextfieldDecoration(textFieldTitle: "enter your email address."),
              SizedBox(height: 12,),
              Text("Password" , style: AppConstants.loginTextFieldTilte,),
              SizedBox(height: 12,),
              CustomTextfieldDecoration(textFieldTitle: "enter your password."),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text("Sign Up " , style: AppConstants.loginTextFieldTilte.copyWith(color: AppConstants.blueBackgroundColor),)),

            ],
          ),
        ),
      ),
    );
  }
}
