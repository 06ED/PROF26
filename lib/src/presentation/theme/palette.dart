import 'package:flutter/material.dart';

abstract class Palette {
  abstract Color backgroundColor;
  abstract Color foregroundColor;
}

class DarkPalette extends Palette {
  @override
  Color backgroundColor = Colors.black;

  @override
  Color foregroundColor = Colors.white;
}

class LightPalette extends Palette {
  @override
  Color backgroundColor = Colors.white;

  @override
  Color foregroundColor = Colors.black;
}
