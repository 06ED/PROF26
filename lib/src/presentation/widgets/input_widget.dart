import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CustomInputWidget extends StatefulWidget {
  final String label;
  final String hint;
  final String error;
  final TextEditingController controller;
  final bool isPassword;

  const CustomInputWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.error,
    required this.controller,
    this.isPassword = false,
  });

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();

  static Story get story => Story(
    name: "CustomInputWidget",
    builder: (BuildContext context) {
      var label = context.knobs.text(label: "Label", initial: "Пароль");
      var hint = context.knobs.text(label: "Hint", initial: "********");
      var error = context.knobs.text(label: "Error", initial: "Введите пароль");
      var text = context.knobs.text(label: "Text", initial: "12345678");
      var isPassword = context.knobs.boolean(
        label: "IsPassword",
        initial: true,
      );

      return CustomInputWidget(
        label: label,
        hint: hint,
        error: error,
        controller: TextEditingController(text: text),
        isPassword: isPassword,
      );
    },
  );
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  var _isObscured = true;

  void _switchObscure() {
    setState(() {
      _isObscured = !_isObscured;
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
        if (widget.label.isNotEmpty)
          Text(
            widget.label,
            style: theme.styles.nunitoMedium14.copyWith(
              color: theme.palette.textSecondary,
            ),
          ),
        TextField(
          obscureText: _isObscured && widget.isPassword,
          obscuringCharacter: "*",
          cursorColor: theme.palette.accent,
          cursorWidth: 2.w,
          cursorHeight: 20.h,
          controller: widget.controller,
          style: theme.styles.nunitoRegular12,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.error.isNotEmpty
                ? theme.palette.error.withAlpha(0x4D)
                : theme.palette.block,
            hintText: widget.hint,
            hintStyle: theme.styles.nunitoRegular12.copyWith(
              color: theme.palette.hint,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.error.isNotEmpty
                    ? theme.palette.error
                    : theme.palette.border,
                width: 1.r,
              ),
              borderRadius: .circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.error.isNotEmpty
                    ? theme.palette.error
                    : theme.palette.border,
                width: 1.r,
              ),
              borderRadius: .circular(10.r),
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: _switchObscure,
                    child: SvgPicture.asset(
                      _isObscured
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
        if (widget.error.isNotEmpty)
          Text(
            widget.error,
            style: theme.styles.nunitoRegular12.copyWith(
              color: theme.palette.error,
            ),
          ),
      ],
    );
  }
}
