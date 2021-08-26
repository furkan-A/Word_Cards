import 'package:flutter/material.dart';

import 'constants.dart';

class Words extends StatefulWidget {
  const Words({Key? key}) : super(key: key);

  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
  static String title = 'Words';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: appBarStyle,
        ),
        // backgroundColor: Colors.redAccent[100],
      ),
      body: Center(child: ListView()),
    );
  }
}
