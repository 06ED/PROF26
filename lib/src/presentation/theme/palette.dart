import 'package:flutter/material.dart';

abstract class Palette {
  abstract Color backgroundColor;
  abstract Color foregroundColor;
  abstract Color accent;
  abstract Color accentInactive;
  abstract Color black;
  abstract Color error;
  abstract Color white;
  abstract Color inputBackground;
  abstract Color inputIcon;
  abstract Color description;
}

class DarkPalette extends Palette {
  @override
  Color backgroundColor = Colors.black;

  @override
  Color foregroundColor = Colors.white;

  @override
  Color accent = Color(0xFF1A6FEE);

  @override
  Color accentInactive = Color(0xFFC9D4FB);

  @override
  Color black = Colors.black;

  @override
  Color inputBackground = Color(0xFFF5F5F9);

  @override
  Color inputIcon = Color(0xFFB8C1CC);

  @override
  Color white = Colors.white;

  @override
  Color description = Color(0xFF7E7E9A);

  @override
  Color error = Colors.red;
}

class LightPalette extends Palette {
  @override
  Color backgroundColor = Colors.white;

  @override
  Color foregroundColor = Colors.black;

  @override
  Color accent = Color(0xFF1A6FEE);

  @override
  Color accentInactive = Color(0xFFC9D4FB);

  @override
  Color black = Colors.black;

  @override
  Color inputBackground = Color(0xFFF5F5F9);

  @override
  Color inputIcon = Color(0xFFB8C1CC);

  @override
  Color white = Colors.white;

  @override
  Color description = Color(0xFF7E7E9A);

  @override
  Color error = Colors.red;
}
