import 'package:ai_notes_app/domain/services/validation_service.dart';
import 'package:ai_notes_app/main.dart';
import 'package:ai_notes_app/presentation/pages/home_page.dart';
import 'package:ai_notes_app/presentation/pages/login_page.dart';
import 'package:ai_notes_app/presentation/widgets/utils.dart';
import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var signupValidation = false;

  String? emailError;
  String? passwordError;
  String? passwordConfirmError;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  void processEmailValidation() {
    setState(() {
      emailError = ValidationService.validateEmail(emailController.text)
          ? null
          : "Введите корректный e-mail!";
    });

    processSignupValidation();
  }

  void processPasswordValidation() {
    setState(() {
      passwordError =
          ValidationService.validatePassword(passwordController.text)
          ? null
          : "Введите корректный пароль!";
    });

    processSignupValidation();
  }

  void processPasswordConfirmValidation() {
    setState(() {
      passwordConfirmError =
          ValidationService.validatePasswordsEquality(
            passwordController.text,
            passwordConfirmController.text,
          )
          ? null
          : "Пароли не совпадают!";
    });

    processSignupValidation();
  }

  void processSignupValidation() {
    setState(() {
      signupValidation =
          ValidationService.validateEmail(emailController.text) &&
          ValidationService.validatePassword(passwordController.text) &&
          ValidationService.validatePasswordsEquality(
            passwordController.text,
            passwordConfirmController.text,
          );
    });
  }

  void processSignup() async {
    await mainUseCase.signup(
      email: emailController.text,
      password: passwordController.text,
      passwordConfirm: passwordConfirmController.text,
      onResponse: (_) async => mainUseCase.login(
        identity: emailController.text,
        password: passwordController.text,
        onResponse: (_) => Get.offAll(HomePage()),
        onError: (error) => showError(error),
      ),
      onError: (error) => showError(error),
    );
  }

  void getToLogin() => Get.off(LoginPage());

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);

    emailController.addListener(processEmailValidation);
    passwordController.addListener(processPasswordValidation);
    passwordConfirmController.addListener(processPasswordConfirmValidation);

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
                        "Создать аккаунт",
                        style: theme.styles.nunitoBold32.copyWith(
                          color: theme.palette.text,
                        ),
                      ),
                    ),
                    Text(
                      "Создайте аккаунт, чтобы начать",
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
                    CustomTextField(
                      label: "Повторите пароль",
                      hint: "********",
                      error: passwordConfirmError,
                      controller: passwordConfirmController,
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
                    onPressed: signupValidation ? processSignup : null,
                  ),
                ),
                GestureDetector(
                  onTap: getToLogin,
                  child: Text(
                    "Уже есть аккаунт?",
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
