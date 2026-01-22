import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Palette palette;
  final Styles styles = .new();

  CustomTheme({required this.palette});

  @override
  ThemeExtension<CustomTheme> copyWith() => this;

  @override
  ThemeExtension<CustomTheme> lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) => this;

  static CustomTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomTheme>()!;
}
