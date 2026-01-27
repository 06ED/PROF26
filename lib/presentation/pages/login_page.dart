import 'package:ai_notes_app/domain/services/validation_service.dart';
import 'package:ai_notes_app/main.dart';
import 'package:ai_notes_app/presentation/widgets/utils.dart';
import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var loginValidation = false;

  String? emailError;
  String? passwordError;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void processEmailValidation() {
    setState(() {
      emailError = ValidationService.validateEmail(emailController.text)
          ? null
          : "Введите корректный e-mail!";
    });

    processLoginValidation();
  }

  void processPasswordValidation() {
    setState(() {
      passwordError =
          ValidationService.validatePassword(passwordController.text)
          ? null
          : "Введите корректный пароль!";
    });

    processLoginValidation();
  }

  void processLoginValidation() {
    setState(() {
      loginValidation =
          ValidationService.validateEmail(emailController.text) &&
          ValidationService.validatePassword(passwordController.text);
    });
  }

  void processLogin() async {
    await mainUseCase.login(
      identity: emailController.text,
      password: passwordController.text,
      onResponse: (_) {
        // TODO: переход на HomePage
        throw UnimplementedError();
      },
      onError: (error) {
        showError(error);
      },
    );
  }

  void getToSignup() {
    // TODO: переход на SignupPage
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);

    emailController.addListener(processEmailValidation);
    passwordController.addListener(processPasswordValidation);

    return Scaffold(
      backgroundColor: theme.palette.background,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: 18.h,
          right: 20.w,
          bottom: 49.h,
          left: 20.w,
        ).add(MediaQuery.paddingOf(context)),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .stretch,
          children: [
            Column(
              spacing: 48.h,
              children: [
                Column(
                  crossAxisAlignment: .stretch,
                  spacing: 14.h,
                  children: [
                    Padding(
                      padding: .only(right: 3.w, left: 2.w),
                      child: Text(
                        "Войти",
                        style: theme.styles.nunitoBold32.copyWith(
                          color: theme.palette.text,
                        ),
                      ),
                    ),
                    Text(
                      "Войдите в аккаунт, чтобы начать",
                      style: theme.styles.nunitoMedium16.copyWith(
                        color: theme.palette.text,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: .stretch,
                  spacing: 14.h,
                  children: [
                    CustomTextField(
                      label: "E-mail",
                      hint: "example@gmail.com",
                      error: emailError,
                      controller: emailController,
                    ),
                    CustomTextField(
                      label: "Пароль",
                      hint: "********",
                      error: passwordError,
                      controller: passwordController,
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
                  child: CustomFilledButton.orange(
                    theme: theme,
                    text: "Войти",
                    onPressed: loginValidation ? processLogin : null,
                  ),
                ),
                GestureDetector(
                  onTap: getToSignup,
                  child: Text(
                    "Ещё нет аккаунта?",
                    style: theme.styles.nunitoRegular12.copyWith(
                      color: theme.palette.text,
                    ),
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
