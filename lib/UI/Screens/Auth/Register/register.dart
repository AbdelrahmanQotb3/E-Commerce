import 'package:e_commerce/UI/Screens/Auth/Login/login.dart';
import 'package:e_commerce/Utilities/add_logo.dart';
import 'package:e_commerce/Utilities/app_colors.dart';
import 'package:e_commerce/Utilities/app_constants.dart';
import 'package:e_commerce/Utilities/custome_textField_decoration.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static String routeName = "Register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {TextEditingController nameController = TextEditingController();
TextEditingController mobileNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.blueBackgroundColor,
      body: Form(
        key: formKey,
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
                  Controller: nameController,
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
                  Controller: mobileNumberController,
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
                  Controller: emailController,
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
                  Controller: passwordController,
                  Validator: (text){
                    if(text == null || text.length < 6){
                      return "Please enter a valid password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Validation();
                }, child: Text("Sign Up " , style: AppConstants.loginTextFieldTilte.copyWith(color: AppColors.blueBackgroundColor),)),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void Validation() {
    if(!formKey.currentState!.validate()){
      return;
    }else{
      Navigator.pushReplacementNamed(context, Login.routeName);
    }
  }
}


