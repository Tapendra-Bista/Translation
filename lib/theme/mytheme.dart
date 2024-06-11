import 'package:flutter/material.dart';

ThemeData myLightTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  hintColor: Colors.black.withOpacity(0.09),
  cardColor: Colors.transparent,
  secondaryHeaderColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
      headlineSmall: TextStyle(
    fontSize: 20,
    fontFamily: "font/roboto.ttf",
    color: Colors.black,
    fontWeight: FontWeight.w300,
  )),
);

ThemeData myDarkTheme = ThemeData(
  secondaryHeaderColor: Colors.white,
  brightness: Brightness.light,
  primaryColor: Colors.orange,
  cardColor: Colors.white.withOpacity(0.05),
  hintColor: Colors.white.withOpacity(0.09),
  scaffoldBackgroundColor: Colors.black.withOpacity(0.5),
  textTheme: const TextTheme(
      headlineSmall: TextStyle(
    fontSize: 20,
    fontFamily: "font/roboto.ttf",
    color: Colors.white,
    fontWeight: FontWeight.w300,
  )),
);
