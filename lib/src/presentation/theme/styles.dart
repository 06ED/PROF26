import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prof_26_uikit/src/presentation/theme/palette.dart';

class Styles {
  final Palette palette;

  Styles({required this.palette});

  TextStyle get defaultStyle => TextStyle(color: palette.foregroundColor);

  TextStyle get title3Semibold17 => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17.sp,
    height: 24 / 17,
    letterSpacing: 0,
  );

  TextStyle get captionSemibold14 => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    height: 20 / 14,
    letterSpacing: 0,
  );
}
