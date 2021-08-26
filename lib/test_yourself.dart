import 'package:flutter/material.dart';

import 'package:words/question_card.dart';
import 'package:words/vocabulary.dart';

import 'constants.dart';

class Testyourself extends StatefulWidget {
  const Testyourself({Key? key}) : super(key: key);

  @override
  _TestyourselfState createState() => _TestyourselfState();
}

class _TestyourselfState extends State<Testyourself> {
  static String title = 'Test Yourself';
  Vocabulary vocab = Vocabulary();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text(
          title,
          style: appBarStyle,
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text.rich(
                TextSpan(
                  text: "Question 1",
                  style: TextStyle(fontSize: 24),
                  children: [
                    TextSpan(
                      text: "/10",
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => QuestionCard(vocab: vocab),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
