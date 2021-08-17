import 'package:flutter/material.dart';
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
            // Add your onPressed code here!
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        appBar: AppBar(
          title: const Text(_title),
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
                  child: createButton('Learn Words'),
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
                  height: 20,
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
    // String title = "";
    return Container(
      padding:
          const EdgeInsets.only(left: 30.0, top: 8.0, right: 30.0, bottom: 8.0),
      // margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(25),
      ),
      // color: Colors.amber,
      child: Text(
        title,
        style: buttonStyle,
      ),
    );
  }
}
