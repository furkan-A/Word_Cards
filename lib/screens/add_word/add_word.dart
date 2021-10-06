import 'package:flutter/material.dart';
import 'package:words/screens/add_word/new_word.dart';
import 'package:words/models/vocabulary.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class AddWord extends StatelessWidget {
  Vocabulary vocabulary;

  AddWord({Key? key, required this.vocabulary}) : super(key: key);

  static String title = 'Add New Words';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                    'Write a word down below \nyou want to learn',
                    style: wordStyle2,
                    textAlign: TextAlign.center,
                  ),
                  NewWord(vocabulary: vocabulary),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
