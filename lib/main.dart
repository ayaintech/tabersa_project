import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabersa_project/constant/constants.dart';
import 'package:tabersa_project/screens/00_welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TABERSA",
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        fontFamily: kFontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
    // throw UnimplementedError();
  }
}
