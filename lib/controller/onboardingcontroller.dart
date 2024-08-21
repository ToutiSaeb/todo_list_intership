import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/core/constant/routename.dart';


class Onboardingcontroller extends GetxController{
  
void next(context) {
  
  showDialog(
    barrierColor: Colors.black,
    context: context,
    barrierDismissible: false, 
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          
        ),
      );
    },
  );
  Future.delayed(const Duration(milliseconds: 900), () {

    Navigator.pop(context);
  
 Get.offAllNamed(Routename.home);

  });
    
}


}