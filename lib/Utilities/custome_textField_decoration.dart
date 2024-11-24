import 'package:flutter/material.dart';

class CustomTextfieldDecoration extends StatelessWidget {
  String textFieldTitle;
  CustomTextfieldDecoration({super.key , required this.textFieldTitle});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
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
    );
  }
}
