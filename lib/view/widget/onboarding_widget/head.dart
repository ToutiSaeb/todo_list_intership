import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  const Head({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2,  
              child: const Column(
                children: [
                  SizedBox(height:100,),
                  Text("You suck at\ntaking notes\nbrother,you\nneed us :)",
              
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
              ),           
                ],
              ) 
            );
  }
}