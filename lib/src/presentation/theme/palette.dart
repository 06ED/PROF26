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
  Color get accent => .new(0xFF7193F0);

  @override
  Color get background => .new(0xFF121318);

  @override
  Color get black => .new(0xFF000000);

  @override
  Color get block => .new(0xFF2A2E38);

  @override
  Color get border => .new(0xFF3A3F4C);

  @override
  Color get button => .new(0xFFDE7C3E);

  @override
  Color get buttonInactive => .new(0xFFCD7B45);

  @override
  Color get error => .new(0xFFF27872);

  @override
  Color get hint => .new(0xFF7E8491);

  @override
  Color get icon => .new(0xFFF6F7FB);

  @override
  Color get text => .new(0xFFC8CDDE);

  @override
  Color get textSecondary => .new(0xFFB4BAC6);
}

class LightPalette extends Palette {
  @override
  Color get accent => .new(0xFF4A77D9);

  @override
  Color get background => .new(0xFFF9F6EC);

  @override
  Color get black => .new(0xFFFFFFFF);

  @override
  Color get block => .new(0xFFFFEFD9);

  @override
  Color get border => .new(0xFFCBB89F);

  @override
  Color get button => .new(0xFFFF9C5A);

  @override
  Color get buttonInactive => .new(0xFFA55C2E);

  @override
  Color get error => .new(0xFFE06355);

  @override
  Color get hint => .new(0xFFB1A79C);

  @override
  Color get icon => .new(0xFF23201C);

  @override
  Color get text => .new(0xFF433E36);

  @override
  Color get textSecondary => .new(0xFF7A726A);
}
