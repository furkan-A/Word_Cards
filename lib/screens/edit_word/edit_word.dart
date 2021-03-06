import 'package:flutter/material.dart';
import 'package:words/constants.dart';
import 'package:words/models/vocabulary.dart';
import 'package:words/models/word.dart';

// ignore: must_be_immutable
class EditWord extends StatelessWidget {
  Vocabulary vocabulary;
  Word word;

  EditWord({Key? key, required this.vocabulary, required this.word})
      : super(key: key);
  static String title = 'Edit the Word';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title),
      body: SingleChildScrollView(
        // primary: false,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 48),
                  Text(
                    'Check the word information down below \nyou want to change',
                    style: wordStyle2,
                    textAlign: TextAlign.center,
                  ),
                  // NewWord(vocabulary: vocabulary),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
