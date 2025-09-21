import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(stories: []);
  }
}

void showStorybook() {
  runApp(StorybookApp());
}
