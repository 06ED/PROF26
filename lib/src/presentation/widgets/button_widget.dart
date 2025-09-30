import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:prof_26_uikit/prof_26_uikit.dart";
import "package:storybook_flutter/storybook_flutter.dart";

abstract class BaseButtonWidget extends StatelessWidget {
  final CustomTheme theme;
  final Function()? onTap;
  final Color backgroundColor;
  final Color? disabledBackgroundColor;
  final Color strokeColor;
  final Color textColor;
  final String text;

  const BaseButtonWidget({
    super.key,
    required this.theme,
    required this.onTap,
    required this.backgroundColor,
    required this.disabledBackgroundColor,
    required this.strokeColor,
    required this.textColor,
    required this.text,
  });

  @protected
  double? get width;

  @protected
  double get height;

  @protected
  TextStyle get textStyle;

  @protected
  EdgeInsets get padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          padding: padding,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(width: 1.r, color: strokeColor),
          ),
        ),
        child: Text(
          text,
          style: textStyle.copyWith(
            color: textColor,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class BigButtonWidget extends BaseButtonWidget {
  const BigButtonWidget({
    super.key,
    required super.theme,
    required super.onTap,
    required super.backgroundColor,
    required super.disabledBackgroundColor,
    required super.strokeColor,
    required super.textColor,
    required super.text,
  });

  @override
  double get height => 56.h;

  @override
  double? get width => 335.w;

  @override
  EdgeInsets get padding => EdgeInsets.all(16.r);

  @override
  TextStyle get textStyle => theme.styles.title3Semibold17;

  BigButtonWidget.filled({
    super.key,
    required super.theme,
    required super.onTap,
    required super.text,
  }) : super(
    backgroundColor: theme.palette.accent,
    disabledBackgroundColor: theme.palette.accentInactive,
    strokeColor: Colors.transparent,
    textColor: theme.palette.white,
  );

  BigButtonWidget.outlined({
    super.key,
    required super.theme,
    required super.onTap,
    required super.text,
  }) : super(
    backgroundColor: Colors.transparent,
    disabledBackgroundColor: Colors.transparent,
    strokeColor: theme.palette.accent,
    textColor: theme.palette.accent,
  );

  BigButtonWidget.simple({
    super.key,
    required super.theme,
    required super.onTap,
    required super.text,
  }) : super(
    backgroundColor: theme.palette.inputBackground,
    disabledBackgroundColor: Colors.transparent,
    strokeColor: Colors.transparent,
    textColor: theme.palette.black,
  );

  static Story get story =>
      Story(
        name: "BigButtonWidget",
        builder: (BuildContext context) {
          var theme = CustomTheme.of(context);

          void onTap() {
            debugPrint("BigButtonWidget");
          }

          String text = context.knobs.text(
              label: "Text", initial: "Подтвердить");
          int type = context.knobs.options(
            label: "Type",
            initial: 0,
            options: [
              Option(label: "Filled", value: 0),
              Option(label: "Outlined", value: 1),
              Option(label: "Simple", value: 2),
            ],
          );
          bool active = context.knobs.boolean(label: "Active", initial: true);

          switch (type) {
            case 0:
              return BigButtonWidget.filled(
                theme: theme,
                onTap: active ? onTap : null,
                text: text,
              );
            case 1:
              return BigButtonWidget.outlined(
                theme: theme,
                onTap: active ? onTap : null,
                text: text,
              );
            case _:
              return BigButtonWidget.simple(
                theme: theme,
                onTap: active ? onTap : null,
                text: text,
              );
          }
        },
      );
}

class SmallButtonWidget extends BigButtonWidget {
  const SmallButtonWidget({
    super.key,
    required super.theme,
    required super.onTap,
    required super.backgroundColor,
    required super.disabledBackgroundColor,
    required super.strokeColor,
    required super.textColor,
    required super.text,
  });

  @override
  double get height => 40.h;

  @override
  double? get width => 96.w;

  @override
  EdgeInsets get padding =>
      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h);

  @override
  TextStyle get textStyle => theme.styles.captionSemibold14;

  SmallButtonWidget.filled({
    super.key,
    required super.theme,
    required super.onTap,
    required super.text,
  }) : super.filled();

  SmallButtonWidget.outlined({
    super.key,
    required super.theme,
    required super.onTap,
    required super.text,
  }) : super.outlined();

  SmallButtonWidget.simple({
    super.key,
    required super.theme,
    required super.onTap,
    required super.text,
  }) : super.simple();

  static Story get story =>
      Story(
        name: "SmallButtonWidget",
        builder: (BuildContext context) {
          var theme = CustomTheme.of(context);

          void onTap() {
            debugPrint("SmallButtonWidget");
          }

          String text = context.knobs.text(
              label: "Text", initial: "Добавить");
          int type = context.knobs.options(
            label: "Type",
            initial: 0,
            options: [
              Option(label: "Filled", value: 0),
              Option(label: "Outlined", value: 1),
              Option(label: "Simple", value: 2),
            ],
          );
          bool active = context.knobs.boolean(label: "Active", initial: true);

          switch (type) {
            case 0:
              return SmallButtonWidget.filled(
                theme: theme,
                onTap: active ? onTap : null,
                text: text,
              );
            case 1:
              return SmallButtonWidget.outlined(
                theme: theme,
                onTap: active ? onTap : null,
                text: text,
              );
            case _:
              return SmallButtonWidget.simple(
                theme: theme,
                onTap: active ? onTap : null,
                text: text,
              );
          }
        },
      );
}
