import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Palette palette;

  CustomTheme({required this.palette});

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
