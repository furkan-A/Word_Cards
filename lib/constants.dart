import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle buttonStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Baloo',
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5);

TextStyle buttonStyle2 = const TextStyle(
    color: Colors.white, fontFamily: 'Baloo', fontSize: 16, letterSpacing: 0.3);

TextStyle caption = const TextStyle(
  fontFamily: 'Kalam',
  color: Colors.teal,
  fontSize: 60,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
);

TextStyle caption2 = const TextStyle(
  fontFamily: 'Kalam',
  color: Colors.black87,
  fontSize: 36,
  fontWeight: FontWeight.normal,
);

TextStyle wordStyle =
    const TextStyle(fontFamily: 'Kalam', color: Colors.black, fontSize: 24);

TextStyle wordStyle2 =
    const TextStyle(fontFamily: 'Kalam', color: Colors.black, fontSize: 24);

TextStyle keyStyle =
    const TextStyle(fontFamily: 'Kalam', color: Colors.black, fontSize: 18);

TextStyle meanStyle =
    const TextStyle(fontFamily: 'Baloo', color: Colors.black87, fontSize: 16);

TextStyle descStyle =
    const TextStyle(fontFamily: 'Kalam', color: Colors.black, fontSize: 16);

TextStyle appBarStyle = const TextStyle(
    fontFamily: 'Baloo',
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    letterSpacing: 0.2);

const kTextColor = Colors.black;
const kButtonColor = Colors.teal;
const kGreenColor = Colors.green;
const kRedColor = Colors.red;
const kGreyColor = Colors.grey;

AppBar myAppBar(String title) => AppBar(
      elevation: 0,
      title: Text(
        title,
        style: appBarStyle,
      ),
      backgroundColor: Colors.teal,
    );

Container createButton(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 56.0,
      vertical: 8.0,
    ),
    decoration: BoxDecoration(
      color: kButtonColor,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(
      title,
      style: buttonStyle,
    ),
  );
}
