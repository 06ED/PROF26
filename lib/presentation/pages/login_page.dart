import 'package:ai_notes_app/domain/services/validation_service.dart';
import 'package:ai_notes_app/presentation/pages/home_page.dart';
import 'package:ai_notes_app/presentation/pages/signup_page.dart';
import 'package:ai_notes_app/presentation/widgets/utils.dart';
import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _useCase = Get.find<QueryUseCase>();

  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);

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
        child: Form(
          key: _formKey,
          autovalidateMode: .onUnfocus,
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
                        controller: _emailController,
                        validator: _processEmailValidation,
                      ),
                      CustomTextField(
                        label: "Пароль",
                        hint: "********",
                        controller: _passwordController,
                        validator: _processPasswordValidation,
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
                      onPressed: _processLogin,
                    ),
                  ),
                  GestureDetector(
                    onTap: _getToSignup,
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
      ),
    );
  }

  String? _processEmailValidation(String? text) =>
      text != null && ValidationService.validateEmail(text)
      ? null
      : "Введите корректный e-mail!";

  String? _processPasswordValidation(String? text) =>
      text != null && ValidationService.validatePassword(text)
      ? null
      : "Введите корректный пароль!";

  Future<void> _processLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _useCase.login(
        identity: _emailController.text,
        password: _passwordController.text,
        onResponse: (_) => Get.offAll(HomePage()),
        onError: (error) => showError(error),
      );
    }
  }

  void _getToSignup() => Get.off(SignupPage());
}
