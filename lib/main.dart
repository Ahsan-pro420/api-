import 'package:api_tutorial/screens/Home_screen.dart';
import 'package:api_tutorial/screens/examplefour.dart';
import 'package:api_tutorial/screens/examplethree.dart';
import 'package:api_tutorial/screens/exampletwo.dart';
import 'package:api_tutorial/screens/imageupload.dart';
import 'package:api_tutorial/screens/signUpApi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Uploadimage(),
    );
  }
}
