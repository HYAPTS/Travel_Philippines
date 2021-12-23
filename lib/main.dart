
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'onBoarding_page.dart';
void main(){

  runApp(MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage());
  }
}