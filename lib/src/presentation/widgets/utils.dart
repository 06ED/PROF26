import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialAppWrapper extends StatelessWidget {
  final Widget? widget;

  const MaterialAppWrapper({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: .new(376, 832),
      child: MaterialApp(
        theme: .light().copyWith(
          extensions: [CustomTheme(palette: LightPalette())],
        ),
        darkTheme: .dark().copyWith(
          extensions: [CustomTheme(palette: DarkPalette())],
        ),
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            var theme = CustomTheme.of(context);

            return Scaffold(
              backgroundColor: theme.palette.background,
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: .symmetric(horizontal: 16.w, vertical: 32.h),
                child: Center(
                  child:
                      widget ??
                      CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        color: theme.palette.accent,
                      ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
