import 'package:ai_notes_app/main.dart';
import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);

    return Scaffold(
      backgroundColor: theme.palette.background,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: MediaQuery.paddingOf(context),
        child: Center(
          child: Text(
            "Authorized successfully!\nWelcome to HomePage()\n\n${mainUseCase.lastAuth!.record.toString()}",
            textAlign: .center,
            style: theme.styles.nunitoMedium18.copyWith(
              color: theme.palette.text,
            ),
          ),
        ),
      ),
    );
  }
}
