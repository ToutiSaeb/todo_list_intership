import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(left: 30),
               width: double.infinity,
               height: MediaQuery.of(context).size.height/2, 
               child: Image.asset('images/onboarding.png',fit: BoxFit.fill,),            
            );
  }
}