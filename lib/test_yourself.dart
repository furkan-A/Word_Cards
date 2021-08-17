import 'package:flutter/material.dart';

class Testyourself extends StatefulWidget {
  const Testyourself({Key? key}) : super(key: key);

  @override
  _TestyourselfState createState() => _TestyourselfState();
}

class _TestyourselfState extends State<Testyourself> {
  static String title = 'Test Yourself';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
