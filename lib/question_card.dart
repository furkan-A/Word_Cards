import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:words/question_controller.dart';
import 'package:words/score_screen.dart';
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

  QuestionController _controller = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        margin: const EdgeInsets.only(bottom: 32, right: 12, left: 12, top: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Text(
              vocab.getKey(),
              style: wordStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            getOption(0),
            getOption(1),
            getOption(2),
            getOption(3),
            const Spacer(flex: 1),
            InkWell(
              onTap: () {
                Route route = MaterialPageRoute(builder: (context) {
                  return ScoreScreen(score: _controller.numOfCorrectAns);
                });
                Navigator.push(context, route);
              },
              child: createButton("Finish"),
            ),
            const SizedBox(height: 4)
          ],
        ),
      ),
    );
  }

  void createOptions() {
    options.clear();
    Option opTrue = Option(
      text: vocab.getMean(),
      isTrue: true,
      press: () {
        _controller.checkAnswer(true, vocab.size());
      },
    );
    options.add(opTrue);
    for (int i = 0; i < 3; i++) {
      Option opFalse = Option(
        text: vocab.getRandomMean(),
        press: () {
          _controller.checkAnswer(false, vocab.size());
        },
        isTrue: false,
      );
      options.add(opFalse);
    }
  }

  List<Option> pickRandomOption() {
    createOptions();
    Option option;
    for (int i = 0; i < 4; i++) {
      option = options[rnd.nextInt(options.length)];
      randomOptions.add(option);
      options.remove(option);
    }
    return randomOptions;
  }

  Option getOption(int index) {
    return pickRandomOption()[index];
  }
}
