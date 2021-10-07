import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:words/screens/quiz/question_card.dart';
import 'package:words/screens/quiz/question_controller.dart';
import 'package:words/models/vocabulary.dart';
import 'package:words/screens/quiz/score_screen.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class Quiz extends StatefulWidget {
  Vocabulary vocabulary;
  Quiz({Key? key, required this.vocabulary}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final String _title = 'Test Yourself';

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Scaffold(
      // backgroundColor: Colors.teal,
      appBar: AppBar(title: Text(_title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text.rich(
                TextSpan(
                  text:
                      "Question ${_questionController.questionNumber.value}", // vocabulary.getIndex() + 1}",
                  style: const TextStyle(
                    fontSize: 32,
                    fontFamily: 'Baloo',
                  ),
                  children: [
                    TextSpan(
                      text: "/${widget.vocabulary.size()}",
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
            // doğru yanlış sayıları
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kGreenColor)),
                  child: Text(
                    'Correct: ${_questionController.numOfCorrectAns}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kRedColor)),
                  child: Text(
                    'Incorrect: ${_questionController.numOfIncorrectAns}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  // onPageChanged: _questionController.updateTheQnNum,
                  itemCount: widget.vocabulary.size(),
                  itemBuilder: (context, index) {
                    widget.vocabulary.nextIndex();
                    return QuestionCard(vocab: widget.vocabulary);
                  }),
            ),
            FractionallySizedBox(
              widthFactor: 0.84,
              child: OutlinedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) {
                    return ScoreScreen(
                        score: _questionController.numOfCorrectAns);
                  });

                  Navigator.push(context, route);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Finish',
                    style: TextStyle(
                        color: kButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14)
          ],
        ),
      ),
    );
  }
}
