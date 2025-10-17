import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:prof_26_uikit/prof_26_uikit.dart";
import "package:storybook_flutter/storybook_flutter.dart";

class InputWidget extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final TextEditingController controller;

  const InputWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.error,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: theme.styles.captionRegular14.copyWith(
              color: theme.palette.description,
            ),
          ),
        TextField(
          cursorColor: theme.palette.accent,
          cursorHeight: 20.h,
          cursorWidth: 2.w,
          controller: controller,
          style: theme.styles.textRegular15.copyWith(
            color: theme.palette.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: (error.isNotEmpty)
                ? theme.palette.error.withValues(alpha: 0.1)
                : theme.palette.inputBackground,
            hintText: hint,
            hintStyle: theme.styles.textRegular15.copyWith(
              color: theme.palette.inputIcon,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (error.isNotEmpty)
                    ? theme.palette.error
                    : (label.isEmpty && controller.text.isNotEmpty)
                    ? theme.palette.inputIcon
                    : theme.palette.inputBackground,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.palette.accent.withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        if (error.isNotEmpty)
          Text(
            error,
            style: theme.styles.captionRegular14.copyWith(
              color: theme.palette.error,
            ),
          ),
      ],
    );
  }

  static Story get story => Story(
    name: "InputWidget",
    builder: (BuildContext context) {
      String text = context.knobs.text(label: "Text", initial: "Иван");
      String label = context.knobs.text(label: "Label", initial: "Имя");
      String hint = context.knobs.text(label: "Hint", initial: "Введите имя");
      String error = context.knobs.text(
        label: "Error",
        initial: "Введите ваше имя",
      );
      return InputWidget(
        label: label,
        hint: hint,
        error: error,
        controller: TextEditingController(text: text),
      );
    },
  );
}
