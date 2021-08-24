import 'package:flutter/material.dart';

class AddWord extends StatelessWidget {
  const AddWord({Key? key}) : super(key: key);
  static String title = 'Add New Words';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
