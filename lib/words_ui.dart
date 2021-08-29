import 'package:flutter/material.dart';
import 'package:words/vocabulary.dart';

import 'constants.dart';

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
      appBar: myAppBar(_title),
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
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: kButtonColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: kButtonColor,
                                ),
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
}
