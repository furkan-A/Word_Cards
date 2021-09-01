import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';
// import 'package:words/home_page.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return new SplashScreen(
    //   seconds: 14,
    //   navigateAfterSeconds: new HomePage(),
    //   title: new Text(
    //     'Welcome In SplashScreen',
    //     style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    //   ),
    //   image: new Image.network(
    //       'https://flutter.io/images/catalog-widget-placeholder.png'),
    //   backgroundColor: Colors.white,
    //   loaderColor: Colors.red,
    // );
  }
}
