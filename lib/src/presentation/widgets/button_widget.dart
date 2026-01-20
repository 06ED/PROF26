import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

abstract class BaseButtonWidget extends StatelessWidget {
  final CustomTheme theme;
  final String text;
  final Function()? onTap;
  final Color backgroundColor;
  final Color? disabledBackgroundColor;
  final Color textColor;

  const BaseButtonWidget({
    super.key,
    required this.theme,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.textColor,
  });

  @protected
  TextStyle get textStyle;

  @protected
  Color get strokeColor;

  @protected
  EdgeInsets get padding;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: FilledButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(10.r),
          side: .new(width: 1.r, color: strokeColor),
        ),
      ),
      child: Text(text, style: textStyle.copyWith(color: textColor)),
    );
  }
}

class CustomButtonWidget extends BaseButtonWidget {
  const CustomButtonWidget({
    super.key,
    required super.theme,
    required super.text,
    required super.onTap,
    required super.backgroundColor,
    required super.disabledBackgroundColor,
    required super.textColor,
  });

  @override
  EdgeInsets get padding => .all(13.r);

  @override
  Color get strokeColor => theme.palette.border;

  @override
  TextStyle get textStyle => theme.styles.nunitoMedium16;

  CustomButtonWidget.orange({
    super.key,
    required super.theme,
    required super.text,
    required super.onTap,
  }) : super(
         backgroundColor: theme.palette.button,
         disabledBackgroundColor: theme.palette.buttonInactive,
         textColor: theme.palette.text,
       );

  CustomButtonWidget.error({
    super.key,
    required super.theme,
    required super.text,
    required super.onTap,
  }) : super(
         backgroundColor: theme.palette.block,
         disabledBackgroundColor: null,
         textColor: theme.palette.error,
       );

  CustomButtonWidget.simple({
    super.key,
    required super.theme,
    required super.text,
    required super.onTap,
  }) : super(
         backgroundColor: theme.palette.block,
         disabledBackgroundColor: null,
         textColor: theme.palette.text,
       );

  static Story get story => Story(
    name: "CustomButtonWidget",
    builder: (BuildContext context) {
      var theme = CustomTheme.of(context);

      void onTap() {
        debugPrint("CustomButtonWidget pressed!");
      }

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
          0 => CustomButtonWidget.orange(
            theme: theme,
            text: text,
            onTap: onTap,
          ),
          1 => CustomButtonWidget.orange(
            theme: theme,
            text: text,
            onTap: onTap,
          ),
          2 => CustomButtonWidget.orange(
            theme: theme,
            text: text,
            onTap: onTap,
          ),
          _ => throw FormatException("Incorrect type! ($type)"),
        },
      );
    },
  );
}
