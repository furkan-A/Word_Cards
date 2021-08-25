import 'dart:math';

import 'package:flutter/material.dart';
import 'package:words/vocabulary.dart';

import 'constants.dart';
import 'option.dart';

// ignore: must_be_immutable
class QuestionCard extends StatelessWidget {
  QuestionCard({
    Key? key,
    required this.vocab,
  }) : super(key: key);

  final Vocabulary vocab;
  List<Option> options = [];
  List<Option> randomOptions = [];
  Random rnd = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 32, right: 12, left: 12, top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            vocab.getKey(),
            style: wordStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Option(text: vocab.getRandomMean(), press: () {}),
          Option(text: vocab.getMean(), press: () {}),
          Option(text: vocab.getRandomMean(), press: () {}),
          Option(text: vocab.getRandomMean(), press: () {}),
        ],
      ),
    );
  }

  // void createOptions() {
  //   options.clear();
  //   Option opTrue = Option(
  //     text: vocab.getMean(),
  //     press: () {},
  //   );
  //   options.add(opTrue);
  //   for (int i = 0; i < 3; i++) {
  //     Option opFalse = Option(
  //       text: vocab.getRandomMean(),
  //       press: () {},
  //     );
  //     options.add(opFalse);
  //   }
  // }

  // List<Option> pickRandomOption() {
  //   createOptions();
  //   Option option;
  //   for (int i = 0; i < options.length; i++) {
  //     option = options[rnd.nextInt(options.length)];
  //     randomOptions.add(option);
  //     options.remove(option);
  //   }
  //   return randomOptions;
  // }
}
