import 'package:ai_notes_app/main.dart';
import 'package:ai_notes_app/presentation/pages/home.dart';
import 'package:ai_notes_app/presentation/pages/login.dart';
import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var errorText = "";

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRepeatController = TextEditingController();

  Future<void> _signup() async {
    await mainUseCase.signup(
      onResponse: (_) async {
        await mainUseCase.login(
          onResponse: (_) {
            Get.offAll(HomePage());
          },
          onError: (e) {
            setState(() {
              errorText = e;
            });
          },
          identity: emailController.text,
          password: passwordController.text,
        );
      },
      onError: (e) {
        setState(() {
          errorText = e;
        });
      },
      email: emailController.text,
      password: passwordController.text,
      passwordConfirm: passwordRepeatController.text,
      name: "John Doe",
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);

    return Scaffold(
      backgroundColor: theme.palette.background,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: .only(
          top: 18.h,
          right: 20.w,
          bottom: 49.h,
          left: 20.w,
        ).add(MediaQuery.paddingOf(context)),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              spacing: 48.h,
              children: [
                Column(
                  crossAxisAlignment: .stretch,
                  spacing: 14.h,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3.w, left: 2.w),
                      child: Text(
                        "Создать аккаунт",
                        style: theme.styles.nunitoBold32,
                      ),
                    ),
                    Text(
                      "Создайте аккаунт, чтобы начать",
                      style: theme.styles.nunitoMedium16,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: .stretch,
                  spacing: 14.h,
                  children: [
                    CustomInputWidget(
                      label: "E-mail",
                      hint: "example@gmail.com",
                      error: errorText,
                      controller: emailController,
                    ),
                    CustomInputWidget(
                      label: "Пароль",
                      hint: "********",
                      error: errorText,
                      controller: passwordController,
                      isPassword: true,
                    ),
                    CustomInputWidget(
                      label: "Повторите пароль",
                      hint: "********",
                      error: errorText,
                      controller: passwordRepeatController,
                      isPassword: true,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              spacing: 28.h,
              children: [
                SizedBox.fromSize(
                  size: .new(336.w, 48.h),
                  child: CustomButtonWidget.orange(
                    theme: theme,
                    text: "Войти",
                    onTap: _signup,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(LoginPage());
                  },
                  child: Text(
                    "Уже есть аккаунт?",
                    style: theme.styles.nunitoRegular12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
