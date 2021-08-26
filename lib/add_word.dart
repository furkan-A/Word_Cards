import 'package:flutter/material.dart';

import 'constants.dart';

class AddWord extends StatelessWidget {
  const AddWord({Key? key}) : super(key: key);
  static String title = 'Add New Words';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: appBarStyle,
        ),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
