import 'package:flutter/material.dart';
import 'package:prof_26_uikit/prof_26_uikit.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class TestButton extends StatelessWidget {
  final String text;

  const TestButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);
    return FilledButton(
      onPressed: () {
        debugPrint("TestButton pressed!");
      },
      style: FilledButton.styleFrom(
        backgroundColor: theme.palette.foregroundColor,
      ),
      child: Text(text, style: theme.styles.invertStyle),
    );
  }

  static Story get story => Story(
    name: "TestButton",
    builder: (BuildContext context) {
      String text = context.knobs.text(label: "Text", initial: "TestButton");

      return TestButton(text: text);
    },
  );
}
