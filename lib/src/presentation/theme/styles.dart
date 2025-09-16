import 'package:flutter/material.dart';
import 'package:prof_26_uikit/src/presentation/theme/palette.dart';

class Styles {
  final Palette palette;

  Styles({required this.palette});

  TextStyle get defaultStyle => TextStyle(color: palette.foregroundColor);
}
