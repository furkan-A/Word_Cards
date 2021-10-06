import 'package:flutter/material.dart';
import 'package:words/constants.dart';

ThemeData theme() {
  return ThemeData(
    // scaffoldBackgroundColor: Colors.white12,
    fontFamily: 'Baloo',
    appBarTheme: appBarTheme(),

    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white12,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: 'Baloo',
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2),
    ),
    // centerTitle: true,
  );
}
