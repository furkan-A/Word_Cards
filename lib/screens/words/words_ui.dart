import 'package:flutter/material.dart';
import 'package:words/screens/edit_word/edit_word.dart';
import 'package:words/models/vocabulary.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class Words extends StatefulWidget {
  Vocabulary vocabulary;
  Words({Key? key, required this.vocabulary}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _WordsState createState() => _WordsState(vocabulary: vocabulary);
}

class _WordsState extends State<Words> {
  final String _title = 'Words';
  Vocabulary vocabulary;
  _WordsState({required this.vocabulary});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: vocabulary.wordBank.length,
          itemBuilder: (context, index) {
            var containers = vocabulary.wordBank
                .map((word) => Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: kButtonColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // color: kButtonColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                word.key,
                                style: keyStyle,
                              ),
                              Text(
                                word.desc,
                                style: meanStyle,
                              ),
                              Text(
                                word.mean,
                                style: meanStyle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Route route =
                                      MaterialPageRoute(builder: (context) {
                                    return EditWord(
                                        vocabulary: vocabulary, word: word);
                                  });
                                  Navigator.push(context, route);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: kButtonColor,
                                ),
                                iconSize: 20,
                              ),
                              IconButton(
                                onPressed: () {
                                  showAlertDialog(context, word);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: kButtonColor,
                                ),
                                iconSize: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                .toList();
            return containers[index];
          },
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, var word) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        setState(() {
          vocabulary.deleteWord(word);
        });
        Navigator.of(context).pop();
      },
    );

    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Warning!"),
      content: const Text("Do you want to delete this word?"),
      actions: [
        okButton,
        cancelButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
