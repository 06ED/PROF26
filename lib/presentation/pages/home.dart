import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prof_26_uikit/prof_26_uikit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);
    final text = "Подтвердить";
    return Scaffold(
      backgroundColor: theme.palette.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 64.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 32.h,
            children: [
              BigButtonWidget.filled(theme: theme, onTap: () {}, text: text),
              BigButtonWidget.filled(theme: theme, onTap: null, text: text),
              BigButtonWidget.outlined(theme: theme, onTap: () {}, text: text),
              BigButtonWidget.simple(theme: theme, onTap: () {}, text: text),
            ],
          ),
        ),
      ),
    );
  }
}
