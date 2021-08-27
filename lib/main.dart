import 'package:flutter/material.dart';
import 'package:words/add_word.dart';
import 'package:words/learn_words.dart';
import 'package:words/test_yourself.dart';
import 'package:words/theme.dart';
import 'package:words/vocabulary.dart';
import 'package:words/words_ui.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: theme(),
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const String _title = "Word Cards";
  Vocabulary vocab = Vocabulary();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) {
              return AddWord(vocabulary: vocab);
            });
            Navigator.push(context, route);
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: kButtonColor,
        ),
        appBar: AppBar(
          title: const Text(
            _title,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.plus_one_rounded),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return LearnWord(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  child: createButton('Learn  Word'),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const Testyourself();
                    });
                    Navigator.push(context, route);
                  },
                  child: createButton('Test Yourself'),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return const Words();
                    });
                    Navigator.push(context, route);
                  },
                  child: createButton('Words'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
