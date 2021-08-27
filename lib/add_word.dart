import 'package:flutter/material.dart';
import 'package:words/vocabulary.dart';
import 'package:words/word.dart';

import 'constants.dart';

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
                    'Write a word down below \nyou wanna learn',
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
          TextButton(
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
            child: createButton('Add - Save'),
            // style: ButtonStyle(),
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: kTextColor),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: kTextColor),
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
