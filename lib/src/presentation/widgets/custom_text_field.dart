import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? error;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.error,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

  static Story get story => .new(
    name: "CustomTextField",
    builder: (context) {
      String label = context.knobs.text(label: "Label", initial: "Пароль");
      String hint = context.knobs.text(label: "Hint", initial: "********");
      String error = context.knobs.text(
        label: "Error",
        initial: "Введите пароль",
      );
      String text = context.knobs.text(label: "Text", initial: "12345678");
      bool isPassword = context.knobs.boolean(
        label: "isPassword",
        initial: true,
      );

      return CustomTextField(
        label: label,
        hint: hint,
        error: error,
        controller: .new(text: text),
        isPassword: isPassword,
      );
    },
  );
}

class _CustomTextFieldState extends State<CustomTextField> {
  var isObscured = true;

  void switchObscure() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);

    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .start,
      spacing: 8.h,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: theme.styles.nunitoMedium14.copyWith(
              color: theme.palette.textSecondary,
            ),
          ),
        TextFormField(
          obscureText: widget.isPassword && isObscured,
          obscuringCharacter: "*",
          cursorColor: theme.palette.accent,
          cursorWidth: 2.w,
          cursorHeight: 20.h,
          style: theme.styles.nunitoRegular12.copyWith(
            color: theme.palette.text,
          ),
          validator: widget.validator,
          controller: widget.controller,
          decoration: .new(
            filled: true,
            fillColor: widget.error != null
                ? theme.palette.error.withAlpha(0x4D)
                : theme.palette.block,
            hintText: widget.hint,
            hintStyle: theme.styles.nunitoRegular12.copyWith(
              color: theme.palette.hint,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: .new(
                color: widget.error != null
                    ? theme.palette.error
                    : theme.palette.border,
                width: 1.r,
              ),
              borderRadius: .circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: .new(
                color: widget.error != null
                    ? theme.palette.error
                    : theme.palette.border,
                width: 1.r,
              ),
              borderRadius: .circular(10.r),
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: switchObscure,
                    child: SvgPicture.asset(
                      isObscured
                          ? "packages/ai_notes_uikit/assets/icons/eye_closed.svg"
                          : "packages/ai_notes_uikit/assets/icons/eye.svg",
                      fit: .scaleDown,
                      width: 24.r,
                      height: 24.r,
                      colorFilter: .mode(theme.palette.icon, .srcIn),
                    ),
                  )
                : null,
          ),
        ),
        if (widget.error != null)
          Text(
            widget.error!,
            style: theme.styles.nunitoRegular12.copyWith(
              color: theme.palette.error,
            ),
          ),
      ],
    );
  }
}
