import 'package:flutter/material.dart';

class CustomTextFieldDecoration extends StatelessWidget {
  String textFieldTitle;
  TextEditingController Controller ;
  FormFieldValidator<String> Validator ;
  CustomTextFieldDecoration({super.key , required this.textFieldTitle , required this.Controller , required this.Validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller ,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: textFieldTitle,
        hintStyle: const TextStyle(),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: Validator ,

    );
  }
}
