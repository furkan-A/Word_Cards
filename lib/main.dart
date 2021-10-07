import 'package:flutter/material.dart';
import 'package:words/screens/home/home_page.dart';
import 'package:words/theme.dart';
import 'package:provider/provider.dart';
// import 'package:words/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => MyTheme(),
        builder: (context, _) {
          final themeProvider = Provider.of<MyTheme>(context);
          return MaterialApp(
            theme: LightTheme(),
            darkTheme: darkTheme(),
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        },
      );
}
