import 'package:flutter/material.dart';
import 'package:words/add_word.dart';
import 'package:words/learn_words.dart';
import 'package:words/test_yourself.dart';
import 'package:words/words_ui.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(accentColor: Colors.grey),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String _title = "Word Cards";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) {
              return const AddWord();
            });
            Navigator.push(context, route);
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        appBar: AppBar(
          title: Text(
            _title,
            style: appBarStyle,
          ),
          backgroundColor: Colors.green[800],
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
                      return const LearnWord();
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

  Container createButton(String title) {
    return Container(
      padding:
          const EdgeInsets.only(left: 70.0, top: 8.0, right: 70.0, bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        style: buttonStyle,
      ),
    );
  }
}
