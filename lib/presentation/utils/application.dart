import 'package:ai_notes_app/presentation/pages/login.dart';
import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(376, 832),
      child: GetMaterialApp(
        theme: ThemeData.light().copyWith(
          extensions: [CustomTheme(palette: LightPalette())],
        ),
        darkTheme: ThemeData.dark().copyWith(
          extensions: [CustomTheme(palette: DarkPalette())],
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
