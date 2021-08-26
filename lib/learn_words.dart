import 'package:flutter/material.dart';
import 'package:words/constants.dart';
import 'package:words/main.dart';
import 'package:words/vocabulary.dart';
import 'package:flip_card/flip_card.dart';

class LearnWord extends StatefulWidget {
  const LearnWord({Key? key}) : super(key: key);

  @override
  _LearnWordState createState() => _LearnWordState();
}

class _LearnWordState extends State<LearnWord> {
  static String title = 'Learn Words';

  Vocabulary vocab = Vocabulary();
  HomePage hp = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: appBarStyle,
        ),
        backgroundColor: Colors.redAccent[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(120),
                ),
                child: SizedBox(
                  height: 324,
                  width: 296,
                  child: FlipCard(
                    front: Card(
                      elevation: 4,
                      child: Center(
                        child: Column(
                          children: [
                            const Spacer(),
                            Text(
                              vocab.getKey(),
                              style: wordStyle,
                            ),
                            const Spacer(),
                            Text(
                              vocab.getDesc(),
                              style: descStyle,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    back: Card(
                      elevation: 4,
                      child: Center(
                        child: Text(
                          vocab.getMean(),
                          style: wordStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  createButton('Prev'),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // vocab.nextIndex();
                      });
                    },
                    child: createButton('Next'),
                  ),
                ],
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                primary: Colors.red[200],
                side: const BorderSide(color: Colors.white12),
              ),
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text('Learned'),
            ),
            // Text(
            //   vocab.getMean(),
            //   style: wordStyle,
            // ),
            // const SizedBox(
            //   height: 55,
            // ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Container createButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.redAccent[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: buttonStyle2,
      ),
    );
  }
}
