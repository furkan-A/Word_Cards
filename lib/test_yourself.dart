import 'package:flutter/material.dart';

import 'package:words/question_card.dart';
import 'package:words/vocabulary.dart';

import 'constants.dart';

// ignore: must_be_immutable
class Testyourself extends StatefulWidget {
  Vocabulary vocabulary;
  Testyourself({Key? key, required this.vocabulary}) : super(key: key);

  @override
  _TestyourselfState createState() =>
      // ignore: no_logic_in_create_state
      _TestyourselfState(vocabulary: vocabulary);
}

class _TestyourselfState extends State<Testyourself> {
  Vocabulary vocabulary;
  _TestyourselfState({required this.vocabulary});
  final String _title = 'Test Yourself';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: myAppBar(_title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text.rich(
                TextSpan(
                  text: "Question 1",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Baloo',
                  ),
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
                itemBuilder: (context, index) =>
                    QuestionCard(vocab: vocabulary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
