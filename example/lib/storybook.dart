import 'package:flutter/material.dart';
import 'package:prof_26_uikit/prof_26_uikit.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      wrapperBuilder: (BuildContext context, Widget? widget) {
        return MaterialAppWrapper(widget: widget);
      },
      stories: [
        BigButtonWidget.story,
        SmallButtonWidget.story,
        TabbarWidget.story,
      ],
    );
  }
}

void showStorybook() {
  runApp(StorybookApp());
}
