import 'package:flutter/material.dart';
import 'package:prof_26_uikit/src/presentation/theme/palette.dart';
import 'package:prof_26_uikit/src/presentation/theme/styles.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Palette palette;
  final Styles styles;

  CustomTheme({required this.palette}) : styles = Styles(palette: palette);

  @override
  ThemeExtension<CustomTheme> copyWith() {
    return CustomTheme(palette: palette);
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    return this;
  }

  static CustomTheme of(BuildContext context) =>
      // var theme = CustomTheme.of(context);
      Theme.of(context).extension<CustomTheme>()!;
}
