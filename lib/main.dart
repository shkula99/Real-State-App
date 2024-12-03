import 'package:flutter/material.dart';
import 'package:home_design/screens/landing_screen.dart';
import 'dart:ui';
import 'package:home_design/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design 1',
      theme: ThemeData(
          primaryColor: COLOR_WHITE,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE),
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat"),
      home: LandingScreen(),
    );
  }
}
