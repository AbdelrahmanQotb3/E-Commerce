import 'package:flutter/material.dart';

import 'app_constants.dart';

class AddLogo extends StatelessWidget {
  const AddLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppConstants.appLogo , height: MediaQuery.of(context).size.height * 0.3, width: MediaQuery.of(context).size.width * 0.3,);
  }
}
