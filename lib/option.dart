import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:words/constants.dart';
import 'package:words/question_controller.dart';

// ignore: must_be_immutable
class Option extends StatelessWidget {
  Option({
    Key? key,
    required this.text,
    // required this.index,
    required this.isTrue,
    required this.press,
  }) : super(key: key);
  final String text;
  bool isTrue;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getTheRightColor() {
          if (qnController.isAnswered) {
            if (isTrue) {
              return kGreenColor;
            } else {
              return kRedColor;
            }
          }
          return kGreyColor;
        }

        IconData getRightIcon() {
          return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: const EdgeInsets.only(top: 14.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(color: getTheRightColor(), fontSize: 14),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == kGreyColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getTheRightColor()),
                  ),
                  child: getTheRightColor() == kGreyColor
                      ? null
                      : Icon(
                          getRightIcon(),
                          size: 16,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
