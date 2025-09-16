import 'package:flutter/material.dart';
import 'package:prof_26_uikit/prof_26_uikit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);
    return Scaffold(
      backgroundColor: theme.palette.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Text("Hello world!", style: theme.styles.defaultStyle),
      ),
    );
  }
}
