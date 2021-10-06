import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:words/screens/quiz/question_controller.dart';
// import 'package:words/screens/quiz/score_screen.dart';
import 'package:words/models/vocabulary.dart';

import '../../constants.dart';
import 'option.dart';

// ignore: must_be_immutable
class QuestionCard extends StatefulWidget {
  QuestionCard({
    Key? key,
    required this.vocab,
  }) : super(key: key);

  final Vocabulary vocab;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
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
            // const Spacer(flex: 1),
            Text(
              widget.vocab.getKey(),
              style: wordStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            getOption(0),
            getOption(1),
            getOption(2),
            getOption(3),
            // const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  void createOptions() {
    options.clear();
    Option opTrue = Option(
      text: widget.vocab.getMean(),
      isTrue: true,
      press: () {
        setState(() {
          _controller.checkAnswer(true, widget.vocab.size());
        });
      },
    );
    options.add(opTrue);
    for (int i = 0; i < 3; i++) {
      Option opFalse = Option(
        text: widget.vocab.getRandomMean(),
        press: () {
          setState(() {
            _controller.checkAnswer(false, widget.vocab.size());
          });
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
