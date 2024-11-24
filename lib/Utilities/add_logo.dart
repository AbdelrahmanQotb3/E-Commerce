import 'package:e_commerce/Utilities/app_images.dart';
import 'package:flutter/material.dart';

class AddLogo extends StatelessWidget {
  const AddLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.appLogo , height: MediaQuery.of(context).size.height * 0.3, width: MediaQuery.of(context).size.width * 0.3,);
  }
}
