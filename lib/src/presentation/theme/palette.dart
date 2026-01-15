import 'package:flutter/material.dart';

abstract class Palette {
  abstract final Color background;
  abstract final Color block;
  abstract final Color black;
  abstract final Color border;
  abstract final Color button;
  abstract final Color buttonInactive;
  abstract final Color icon;
  abstract final Color text;
  abstract final Color textSecondary;
  abstract final Color hint;
  abstract final Color accent;
  abstract final Color error;
}

class DarkPalette extends Palette {
  @override
  Color get accent => Color(0xFF7193F0);

  @override
  Color get background => Color(0xFF121318);

  @override
  Color get black => Color(0xFF000000);

  @override
  Color get block => Color(0xFF2A2E38);

  @override
  Color get border => Color(0xFF3A3F4C);

  @override
  Color get button => Color(0xFFDE7C3E);

  @override
  Color get buttonInactive => Color(0xFFCD7B45);

  @override
  Color get error => Color(0xFFF27872);

  @override
  Color get hint => Color(0xFF7E8491);

  @override
  Color get icon => Color(0xFFF6F7FB);

  @override
  Color get text => Color(0xFFC8CDDE);

  @override
  Color get textSecondary => Color(0xFFB4BAC6);
}

class LightPalette extends Palette {
  @override
  Color get accent => Color(0xFF4A77D9);

  @override
  Color get background => Color(0xFFF9F6EC);

  @override
  Color get black => Color(0xFFFFFFFF);

  @override
  Color get block => Color(0xFFFFEFD9);

  @override
  Color get border => Color(0xFFCBB89F);

  @override
  Color get button => Color(0xFFFF9C5A);

  @override
  Color get buttonInactive => Color(0xFFA55C2E);

  @override
  Color get error => Color(0xFFE06355);

  @override
  Color get hint => Color(0xFFB1A79C);

  @override
  Color get icon => Color(0xFF23201C);

  @override
  Color get text => Color(0xFF433E36);

  @override
  Color get textSecondary => Color(0xFF7A726A);
}
