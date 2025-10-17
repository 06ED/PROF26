import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prof_26_uikit/prof_26_uikit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    var theme = CustomTheme.of(context);
    final text = "Подтвердить";
    final smallText = "Добавить";
    return Scaffold(
      backgroundColor: theme.palette.backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: TabbarWidget(
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 32.h,
              children: [
                BigButtonWidget.filled(theme: theme, onTap: () {}, text: text),
                BigButtonWidget.filled(theme: theme, onTap: null, text: text),
                BigButtonWidget.outlined(
                  theme: theme,
                  onTap: () {},
                  text: text,
                ),
                BigButtonWidget.simple(theme: theme, onTap: () {}, text: text),
                SmallButtonWidget.filled(
                  theme: theme,
                  onTap: () {},
                  text: smallText,
                ),
                SmallButtonWidget.filled(
                  theme: theme,
                  onTap: null,
                  text: smallText,
                ),
                SmallButtonWidget.outlined(
                  theme: theme,
                  onTap: () {},
                  text: smallText,
                ),
                SmallButtonWidget.simple(
                  theme: theme,
                  onTap: () {},
                  text: smallText,
                ),
                InputWidget(
                  label: "",
                  hint: "Введите имя",
                  error: "",
                  controller: TextEditingController(),
                ),
                InputWidget(
                  label: "",
                  hint: "Введите имя",
                  error: "",
                  controller: TextEditingController(text: "Иван"),
                ),
                InputWidget(
                  label: "Имя",
                  hint: "Введите имя",
                  error: "",
                  controller: TextEditingController(),
                ),
                InputWidget(
                  label: "",
                  hint: "Введите имя",
                  error: "Введите ваше имя",
                  controller: TextEditingController(),
                ),
                InputWidget(
                  label: "Имя",
                  hint: "Введите имя",
                  error: "",
                  controller: TextEditingController(text: "Введите имя"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
