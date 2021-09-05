import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:words/score_screen.dart';
import 'package:words/word.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late PageController _pageController;
  PageController get pageController => _pageController;

  // List<Word> _questions = vocabulary.wordBank
  //     .map(
  //       (question) => Container(),
  //     )
  //     .toList();

  late bool _isAnswered;
  bool get isAnswered => _isAnswered;

  // late int _correctAns;
  // int get correctAns => this._correctAns;

  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // RxInt _questionNumber = 1.obs;
  // RxInt get questionNumber => this._questionNumber;

  @override
  void onInit() {
    _pageController = PageController();
    _isAnswered = false;
    // _questionIndex = 0;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();

    _pageController.dispose();
  }

  void checkAnswer(bool isCorrect, int size) {
    _isAnswered = true;
    _questionIndex++;
    if (isCorrect) {
      _numOfCorrectAns++;
    }
    update();
    // user select an answer after 3s it will go to next question
    Future.delayed(const Duration(milliseconds: 1200), () {
      nextQuestion(size);
    });
  }

  void nextQuestion(int size) {
    print("index:$_questionIndex");
    if (_questionIndex != size - 1) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      // when the questions are over

    }
  }
}
