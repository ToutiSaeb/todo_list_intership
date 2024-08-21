import 'package:flutter/material.dart';

class TabContainer extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TabContainer({required this.text, required this.isSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Color.fromARGB(255, 172, 233, 3) : Colors.transparent, // Red background for the selected tab
        border: Border.all(color: isSelected ? Color.fromARGB(255, 172, 233, 3) : Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white, // Text color adjustment
        ),
      ),
    );
  }
}