import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/route.dart';
import 'package:todo_list/view/screen/onboarding.dart';

void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:ThemeData.dark(),
      home: const Onboarding(),
      routes: routes,
    );
  }
}