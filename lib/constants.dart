import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTextColor = Colors.white;
const kDarkTextColor = Colors.black;
const kButtonColor = Colors.teal;
const kDarkButtonColor = Colors.orange;
const kMainColor = Colors.teal;
const kGreenColor = Colors.green;
const kRedColor = Colors.red;
const kGreyColor = Colors.grey;
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;
const kBackgroundColor = Colors.white;
const kDarkBackgroundColor = Colors.grey;

ButtonStyle kButtonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
    // backgroundColor: MaterialStateProperty.all(kMainColor),
    elevation: MaterialStateProperty.all(1),
    // foregroundColor: MaterialStateProperty.all(kTextColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    ),
  );
}

TextStyle buttonStyle = const TextStyle(
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
