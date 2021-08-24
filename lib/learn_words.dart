import 'package:flutter/material.dart';
import 'package:words/constants.dart';
import 'package:words/vocabulary.dart';

class LearnWord extends StatefulWidget {
  const LearnWord({Key? key}) : super(key: key);

  @override
  _LearnWordState createState() => _LearnWordState();
}

class _LearnWordState extends State<LearnWord> {
  static String title = 'Learn Words';

  Vocabulary vocab = Vocabulary();

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
          children: <Widget>[
            Text(
              vocab.getKey(),
              style: wordStyle,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              vocab.getMean(),
              style: wordStyle,
            ),
            const SizedBox(
              height: 55,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    vocab.nextIndex();
                  });
                },
                child: Text(
                  'Next',
                  style: buttonStyle,
                ))
          ],
        ),
      ),
    );
  }
}
