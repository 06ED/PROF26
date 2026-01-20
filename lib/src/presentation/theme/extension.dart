import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:ai_notes_uikit/src/presentation/theme/styles.dart';
import 'package:flutter/material.dart';

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
      Theme.of(context).extension<CustomTheme>()!;
}
