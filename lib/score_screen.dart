import 'package:flutter/material.dart';
import 'package:words/constants.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:words/question_controller.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatelessWidget {
  ScoreScreen({Key? key, required this.score}) : super(key: key);
  int score;
  @override
  Widget build(BuildContext context) {
    // QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Score: $score',
              style: wordStyle,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
