import 'package:flutter/material.dart';
import 'package:words/constants.dart';

class MyTheme extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

ThemeData LightTheme() {
  return ThemeData(
    // scaffoldBackgroundColor: Colors.white12,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kButtonColor,
    ),
    colorScheme: const ColorScheme.light(),
    fontFamily: 'Baloo',
    scaffoldBackgroundColor: Colors.grey[350],

    appBarTheme: appBarTheme(),
    primaryColor: kButtonColor,

    // textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kButtonColor),
        foregroundColor: MaterialStateProperty.all(kTextColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(kMainColor))),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kDarkButtonColor,
    ),
    colorScheme: const ColorScheme.dark(),
    fontFamily: 'Baloo',
    // scaffoldBackgroundColor: kDarkBackgroundColor,
    // appBarTheme: darkAppBarTheme(),
    primaryColor: kDarkButtonColor,
    // textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kDarkButtonColor),
        foregroundColor: MaterialStateProperty.all(kDarkTextColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(kDarkButtonColor),
      ),
    ),
  );
}

// TextTheme textTheme() {
//   return const TextTheme(
//     bodyText1: TextStyle(color: kTextColor),
//   );
// }

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.grey[350],
    elevation: 0,
    iconTheme: const IconThemeData(color: kButtonColor),
    textTheme: const TextTheme(
      headline6: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: kMainColor,
          fontSize: 22,
          fontFamily: 'Baloo',
          fontWeight: FontWeight.bold,
          letterSpacing: 0.2),
    ),
  );
}

// AppBarTheme darkAppBarTheme() {
//   return const AppBarTheme(
//     // color: Colors.grey[350],
//     elevation: 0,
//     iconTheme: const IconThemeData(color: kDarkButtonColor),
//     textTheme: const TextTheme(
//       headline6: TextStyle(
//           overflow: TextOverflow.ellipsis,
//           color: kDarkTextColor,
//           fontSize: 22,
//           fontFamily: 'Baloo',
//           fontWeight: FontWeight.bold,
//           letterSpacing: 0.2),
//     ),
//   );
// }
