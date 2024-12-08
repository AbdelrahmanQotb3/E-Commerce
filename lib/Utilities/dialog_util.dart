import 'package:flutter/material.dart';

import 'app_constants.dart';

abstract class DialogUtil{
   static showLoading(BuildContext context){
     return showDialog(
         context: context,
         builder: (_){
           return AlertDialog(
             content: Row(
               children: [
                 Text(
                   "Loading..",
                   style: AppConstants.dialogText,
                 ),
                 Spacer(),
                 CircularProgressIndicator()
               ],
             ),
           );
         }
     );
   }

   static hideLoading(BuildContext context){
     return Navigator.pop(context);
   }

   static showError(BuildContext context , String errorMessage){
     showDialog(
         context: context,
         builder: (_){
           return AlertDialog(
             title: Text(
               "Error",
               style: AppConstants.dialogText,
             ),
             content: Column(
               children: [
                 Text(
                   errorMessage,
                   style: AppConstants.dialogText,
                 ),
                 Spacer(),
                 ElevatedButton(onPressed: (){
                   Navigator.pop(context);
                 }, child: Text("Try Again" , style: AppConstants.dialogText,))
               ],
             ),

           );
         }
     );
   }

}