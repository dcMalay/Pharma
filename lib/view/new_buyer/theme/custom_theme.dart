import 'package:flutter/material.dart';

class CustomTheme {
  static const Color grey = Color(0xffdFDFDF);
  // static const Color violet = Color.fromARGB(255, 53, 43, 129);
  static const Color violet = Color(0xFF5467ED);
  static const Color lightViolet = Color.fromARGB(255, 181, 173, 240);
  static const cardShadow = [
    BoxShadow(
      color: grey,
      blurRadius: 6,
      spreadRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
  static const buttonShadow = [
    BoxShadow(
      color: grey,
      blurRadius: 3,
      spreadRadius: 4,
      offset: Offset(1, 3),
    ),
  ];

  static getCardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(35),
      boxShadow: cardShadow,
    );
  }

  static ThemeData getTheme() {
    Map<String, double> fontsize = {
      "sm": 14,
      "md": 18,
      "lg": 24,
    };

    return ThemeData(
      primaryColor: violet,
      appBarTheme: AppBarTheme(
        backgroundColor: violet,
        foregroundColor: Colors.black,
        toolbarHeight: 70,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: fontsize['lg'],
          fontWeight: FontWeight.bold,
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Color.fromARGB(255, 93, 90, 241),
        unselectedLabelColor: grey,
      ),
    );
  }
}
