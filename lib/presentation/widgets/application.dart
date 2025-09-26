import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prof_26_app/presentation/pages/home.dart';
import 'package:prof_26_uikit/prof_26_uikit.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: Size(375, 812),
    builder: (_, __) => MaterialApp(
      theme: ThemeData().copyWith(
        extensions: [CustomTheme(palette: LightPalette())],
      ),
      darkTheme: ThemeData().copyWith(
        extensions: [CustomTheme(palette: DarkPalette())],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
