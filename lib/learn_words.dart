import 'package:flutter/material.dart';

class LearnWord extends StatefulWidget {
  const LearnWord({Key? key}) : super(key: key);

  @override
  _LearnWordState createState() => _LearnWordState();
}

class _LearnWordState extends State<LearnWord> {
  static String title = 'Learn Words';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.redAccent[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
