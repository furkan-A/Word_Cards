// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:words/add_word.dart';
import 'package:words/constants.dart';
import 'package:words/learn_words.dart';
import 'package:words/test_yourself.dart';
import 'package:words/theme.dart';
import 'package:words/vocabulary.dart';
import 'package:words/words_ui.dart';
import 'package:share/share.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static const String _title = "Word Cards";
  Vocabulary vocab = Vocabulary();

  void commandLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      // ignore: avoid_print
      print('$command could not launch');
    }
  }

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
              onPressed: () {
                Share.share(
                    'Check out my Vocabulary Learning App - WordCards - '
                    'https://drive.google.com/file/d/1B_PIBBB4yfCJwieF1F'
                    'c9jCvKOhAr1BpA/view?usp=sharing');
              },
              icon: const Icon(Icons.share),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.brightness_6),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Welcome',
                  style: caption2,
                ),
                Text(
                  _title,
                  style: caption,
                ),
                const Spacer(flex: 1),
                InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return LearnWord(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  child: createButton('Learn  Word'),
                  borderRadius: BorderRadius.circular(25),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return Testyourself(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  borderRadius: BorderRadius.circular(25),
                  child: createButton('Test Yourself'),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return Words(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  child: createButton('Words'),
                  borderRadius: BorderRadius.circular(25),
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 18),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Baloo',
                          ),
                          primary: kButtonColor,
                          side: const BorderSide(color: kButtonColor),
                        ),
                        child: const Text(
                          'send\nfeedback',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            height: 1.2,
                          ),
                        ),
                        onPressed: () async {
                          commandLaunch('mailto:fa.softec@gmail.com?subject='
                              'Word%20Card%20Feedback&body=Hi%20WC%20Developer,');
                        },
                      ),
                    ),
                    // const Spacer(),
                  ],
                ),
                const SizedBox(height: 18)
              ],
            ),
          ),
        ),
      ),
    );
  }

// if mail app can't open show alert dialog
  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
