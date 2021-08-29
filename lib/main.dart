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
      debugShowCheckedModeBanner: false,
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
      debugShowCheckedModeBanner: false,
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
          // title: const Text(
          //   _title,
          // ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: caption2,
                ),
                Text(
                  _title,
                  style: caption,
                ),
                const Spacer(flex: 1),
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
                      return Testyourself(vocabulary: vocab);
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
                      return Words(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  child: createButton('Words'),
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 18),
                      // alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        // color: kButtonColor,
                        border: Border.all(color: kButtonColor),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'send\nfeedback',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 22)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
