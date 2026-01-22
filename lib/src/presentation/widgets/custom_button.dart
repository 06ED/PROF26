import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

abstract class CustomBaseButton extends StatelessWidget {
  final CustomTheme theme;
  final String text;
  final TextStyle textStyle;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color? disabledBackgroundColor;

  const CustomBaseButton({
    super.key,
    required this.theme,
    required this.text,
    required this.textStyle,
    required this.onPressed,
    required this.backgroundColor,
    required this.disabledBackgroundColor,
  });

  @protected
  Color get borderColor;

  @protected
  EdgeInsets get padding;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(10.r),
          side: .new(width: 1.r, color: borderColor),
        ),
      ),
      child: Text(text, style: textStyle),
    );
  }
}

class CustomFilledButton extends CustomBaseButton {
  const CustomFilledButton({
    super.key,
    required super.theme,
    required super.text,
    required super.textStyle,
    required super.onPressed,
    required super.backgroundColor,
    required super.disabledBackgroundColor,
  });

  CustomFilledButton.orange({
    super.key,
    required super.theme,
    required super.text,
    required super.onPressed,
  }) : super(
         textStyle: theme.styles.nunitoMedium16.copyWith(
           color: theme.palette.text,
         ),
         backgroundColor: theme.palette.button,
         disabledBackgroundColor: theme.palette.buttonInactive,
       );

  CustomFilledButton.error({
    super.key,
    required super.theme,
    required super.text,
    required super.onPressed,
  }) : super(
         textStyle: theme.styles.nunitoMedium16.copyWith(
           color: theme.palette.error,
         ),
         backgroundColor: theme.palette.block,
         disabledBackgroundColor: null,
       );

  CustomFilledButton.simple({
    super.key,
    required super.theme,
    required super.text,
    required super.onPressed,
  }) : super(
         textStyle: theme.styles.nunitoMedium16.copyWith(
           color: theme.palette.text,
         ),
         backgroundColor: theme.palette.block,
         disabledBackgroundColor: null,
       );

  @override
  Color get borderColor => theme.palette.border;

  @override
  EdgeInsets get padding => .all(13.r);

  static Story get story => .new(
    name: "CustomFilledButton",
    builder: (context) {
      var theme = CustomTheme.of(context);

      void onPressed() {
        debugPrint("CustomFilledButton pressed!");
      }

      bool enabled = context.knobs.boolean(label: "Enabled", initial: true);
      String text = context.knobs.text(label: "Text", initial: "Войти");
      int type = context.knobs.options(
        label: "Type",
        initial: 0,
        options: [
          Option(label: "Orange", value: 0),
          Option(label: "Error", value: 1),
          Option(label: "Simple", value: 2),
        ],
      );

      return SizedBox.fromSize(
        size: .new(336.w, 48.h),
        child: switch (type) {
          0 => CustomFilledButton.orange,
          1 => CustomFilledButton.error,
          2 => CustomFilledButton.simple,
          _ => throw FormatException(type.toString()),
        }(theme: theme, text: text, onPressed: enabled ? onPressed : null),
      );
    },
  );
}
