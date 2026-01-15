import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialAppWrapper extends StatelessWidget {
  final Widget? widget;

  const MaterialAppWrapper({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(376, 832),
      child: MaterialApp(
        theme: ThemeData().copyWith(
          extensions: [CustomTheme(palette: LightPalette())],
        ),
        darkTheme: ThemeData().copyWith(
          extensions: [CustomTheme(palette: DarkPalette())],
        ),
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (BuildContext context) {
            var theme = CustomTheme.of(context);
            return Scaffold(
              backgroundColor: theme.palette.background,
              resizeToAvoidBottomInset: false,
              body: Center(
                child:
                    widget ??
                    CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      color: theme.palette.accent,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
