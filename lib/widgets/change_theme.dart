import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words/theme.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<MyTheme>(context);
    bool toggle = themeProvider.isDarkMode;

    return TextButton.icon(
      style: const ButtonStyle(alignment: AlignmentDirectional.centerStart),
      icon: const Icon(Icons.brightness_6_outlined),
      label: const Text('Light / Dark Theme'),
      onPressed: () {
        toggle = !toggle;
        final pro = Provider.of<MyTheme>(context, listen: false);
        pro.toggleTheme(toggle);
      },
    );
  }
}
