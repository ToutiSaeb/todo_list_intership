import 'package:flutter/material.dart';
import 'package:todo_list/core/constant/routename.dart';
import 'package:todo_list/view/screen/home.dart';
import 'package:todo_list/view/screen/notes.dart';


Map<String, Widget Function(BuildContext)> routes={
  Routename.home:(context)=>const Home(),
  Routename.notes:(context)=>const Notes(),

};