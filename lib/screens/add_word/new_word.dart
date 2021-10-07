// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:words/models/vocabulary.dart';
import 'package:words/models/word.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class NewWord extends StatefulWidget {
  Vocabulary vocabulary;
  NewWord({Key? key, required this.vocabulary}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _NewWordState createState() => _NewWordState(vocabulary: vocabulary);
}

class _NewWordState extends State<NewWord> {
  Vocabulary vocabulary;
  _NewWordState({required this.vocabulary});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String key = '';
  String mean = '';
  String desc = '';
  late Word newWord;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          buildTextFormField('Word'),
          const SizedBox(height: 8),
          buildTextFormField('Mean'),
          const SizedBox(height: 8),
          buildTextFormField('Description'),
          const SizedBox(height: 24),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: ElevatedButton(
              child: FittedBox(
                child: Text(
                  'Add - Save',
                  style: buttonStyle,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // process
                  newWord = Word(key: key, mean: mean, desc: desc);
                  vocabulary.addNewWord(newWord);

                  // if word is successfully added then write toast message.
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('The word is added!'),
                    ),
                  );
                  // after snackbar clear the form fields
                  _formKey.currentState!.reset();
                }
              },
              style: kButtonStyle(),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField(String label) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty && label != 'Description') {
          return 'Please enter a word';
        } else if (label == 'Word') {
          key = value;
        } else if (label == 'Mean') {
          mean = value;
        } else if (label == 'Description') {
          desc = value;
        }
      },
      decoration: InputDecoration(
        labelText: label,
        // hintText: "Enter your word",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: kDarkTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: const BorderSide(color: kDarkTextColor),
          gapPadding: 10,
        ),

        labelStyle: const TextStyle(
          color: Colors.teal,
          fontFamily: 'Baloo',
        ),
      ),
    );
  }
}
