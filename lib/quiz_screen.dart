import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/question_card.dart';
import 'package:words/question_controller.dart';
import 'package:words/vocabulary.dart';
import 'constants.dart';

// ignore: must_be_immutable
class Quiz extends StatelessWidget {
  Vocabulary vocabulary;
  Quiz({Key? key, required this.vocabulary}) : super(key: key);

  final String _title = 'Test Yourself';

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: myAppBar(_title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text.rich(
                TextSpan(
                  text: "Question ${vocabulary.getIndex() + 1}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontFamily: 'Baloo',
                  ),
                  children: [
                    TextSpan(
                      text: "/${vocabulary.size()}",
                      style: const TextStyle(
                        fontSize: 28,
                        fontFamily: 'Baloo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  itemCount: vocabulary.size(),
                  itemBuilder: (context, index) {
                    vocabulary.nextIndex();
                    return QuestionCard(vocab: vocabulary);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
