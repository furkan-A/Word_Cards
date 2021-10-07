// ignore: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:words/screens/add_word/add_word.dart';
import 'package:words/constants.dart';
import 'package:words/screens/learn/learn_words.dart';
import 'package:words/screens/quiz/quiz_screen.dart';
import 'package:words/theme.dart';
import 'package:words/models/vocabulary.dart';
import 'package:words/screens/words/words_ui.dart';
import 'package:share/share.dart';
import 'package:words/widgets/change_theme.dart';

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
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    print('object  $text');
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.grey[350],
          // iconTheme: const IconThemeData(color: kMainColor),
          ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Text(
              'Hello Mr.  fA',
              style: buttonStyle,
            )),
            TextButton.icon(
              style: const ButtonStyle(
                  alignment: AlignmentDirectional.centerStart),
              icon: const Icon(Icons.account_circle_outlined),
              label: const Text('My Account'),
              onPressed: () {},
            ),
            const ChangeTheme(),
            TextButton.icon(
              style: const ButtonStyle(
                  alignment: AlignmentDirectional.centerStart),
              icon: const Icon(Icons.share),
              label: const Text('Share'),
              onPressed: () {
                Share.share(
                    'Check out my Vocabulary Learning App - WordCards - '
                    'https://drive.google.com/file/d/1B_PIBBB4yfCJwieF1F'
                    'c9jCvKOhAr1BpA/view?usp=sharing');
              },
            ),
            TextButton.icon(
              style: const ButtonStyle(
                  alignment: AlignmentDirectional.centerStart),
              icon: const Icon(Icons.feedback_outlined),
              label: const Text('Send Feedback'),
              onPressed: () async {
                commandLaunch('mailto:fa.softec@gmail.com?subject='
                    'Word%20Card%20Feedback&body=Hi%20Developer,');
              },
            ),
            TextButton.icon(
              style: const ButtonStyle(
                  alignment: AlignmentDirectional.centerStart),
              icon: const Icon(Icons.bar_chart_rounded),
              label: const Text('Statics'),
              onPressed: () {},
            ),
          ],
        ),
      ),
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 2),
              Text('Welcome', style: caption2),
              Text(_title, style: caption),
              const Spacer(flex: 4),
              const Spacer(flex: 1),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton(
                  child: FittedBox(
                    child: Text(
                      'Learn Word',
                      style: buttonStyle,
                    ),
                  ),
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return LearnWord(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  style: kButtonStyle(),
                ),
              ),
              const Spacer(flex: 1),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton(
                  child: FittedBox(
                    child: Text(
                      'Test Yourself',
                      style: buttonStyle,
                    ),
                  ),
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return Quiz(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  style: kButtonStyle(),
                ),
              ),
              const Spacer(flex: 2),
              FractionallySizedBox(
                widthFactor: 0.6,
                child: ElevatedButton(
                  child: FittedBox(
                    child: Text(
                      'My Words',
                      style: buttonStyle,
                    ),
                  ),
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) {
                      return Words(vocabulary: vocab);
                    });
                    Navigator.push(context, route);
                  },
                  style: kButtonStyle(),
                ),
              ),
              const Spacer(
                flex: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
