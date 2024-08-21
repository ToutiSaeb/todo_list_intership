import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controller/onboardingcontroller.dart';

import 'package:todo_list/view/widget/onboarding_widget/body.dart';
import 'package:todo_list/view/widget/onboarding_widget/head.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Onboardingcontroller controller=Get.put(Onboardingcontroller());
    return Scaffold(
      body: InkWell(
        onTap: (){
          controller.next(context);
          
        },
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Head(),
             Body(),
              
            ],
          ),
        ),
      ),
    );
  }
}