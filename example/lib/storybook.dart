import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        Story(
          name: "Test",
          builder: (_) => Placeholder(),
        ),
      ],
      wrapperBuilder: (_, widget) => MaterialAppWrapper(widget: widget),
    );
  }
}
