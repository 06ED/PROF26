import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _useCase = Get.find<QueryUseCase>();

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

    return Scaffold(
      backgroundColor: theme.palette.background,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: MediaQuery.paddingOf(context),
        child: Center(
          child: Text(
            "Authorized successfully!\nWelcome to HomePage()\n\n${_useCase.lastAuth!.record.toString()}",
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
