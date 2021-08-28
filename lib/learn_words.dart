import 'package:flutter/material.dart';
import 'package:words/constants.dart';
import 'package:words/main.dart';

import 'package:words/vocabulary.dart';
import 'package:flip_card/flip_card.dart';

// ignore: must_be_immutable
class LearnWord extends StatefulWidget {
  Vocabulary vocabulary;

  LearnWord({Key? key, required this.vocabulary}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _LearnWordState createState() => _LearnWordState(vocabulary: vocabulary);
}

class _LearnWordState extends State<LearnWord> {
  final String _title = 'Learn Words';

  Vocabulary vocabulary;
  _LearnWordState({required this.vocabulary});

  HomePage hp = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        _title,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SizedBox(
                  // height: 512,
                  width: 296,
                  child: FlipCard(
                    front: Card(
                      elevation: 4,
                      child: Center(
                        child: Column(
                          children: [
                            const Spacer(flex: 2),
                            Text(
                              vocabulary.getKey(),
                              style: wordStyle,
                            ),
                            const Spacer(flex: 1),
                            Text(
                              vocabulary.getDesc(),
                              style: descStyle,
                            ),
                            const Spacer(flex: 1),
                          ],
                        ),
                      ),
                    ),
                    back: Card(
                      elevation: 4,
                      child: Center(
                        child: Text(
                          vocabulary.getMean(),
                          style: wordStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        vocabulary.previousIndex();
                      });
                    },
                    child: createButton('Prev'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        vocabulary.nextIndex();
                      });
                    },
                    child: createButton('Next'),
                  ),
                ],
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Baloo',
                ),
                primary: kButtonColor,
                side: const BorderSide(color: kButtonColor),
              ),
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text('Learned'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // Container createButton(String title) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 8),
  //     decoration: BoxDecoration(
  //       color: Colors.redAccent[100],
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Text(
  //       title,
  //       style: buttonStyle2,
  //     ),
  //   );
  // }
}
