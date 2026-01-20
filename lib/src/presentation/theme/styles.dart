import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  final Palette _palette;

  Styles({required Palette palette}) : _palette = palette;

  TextStyle get nunitoBold32 => GoogleFonts.nunito(
    fontWeight: .w700,
    fontSize: 32.sp,
    color: _palette.text,
  );

  TextStyle get nunitoMedium24 => GoogleFonts.nunito(
    fontWeight: .w500,
    fontSize: 24.sp,
    color: _palette.text,
  );

  TextStyle get nunitoMedium22 => GoogleFonts.nunito(
    fontWeight: .w500,
    fontSize: 22.sp,
    color: _palette.text,
  );

  TextStyle get nunitoExtralight20 => GoogleFonts.nunito(
    fontWeight: .w200,
    fontSize: 20.sp,
    color: _palette.text,
  );

  TextStyle get nunitoMedium18 => GoogleFonts.nunito(
    fontWeight: .w500,
    fontSize: 18.sp,
    color: _palette.text,
  );

  TextStyle get nunitoLight18 => GoogleFonts.nunito(
    fontWeight: .w300,
    fontSize: 18.sp,
    color: _palette.text,
  );

  TextStyle get nunitoMedium16 => GoogleFonts.nunito(
    fontWeight: .w500,
    fontSize: 16.sp,
    color: _palette.text,
  );

  TextStyle get nunitoMedium14 => GoogleFonts.nunito(
    fontWeight: .w500,
    fontSize: 14.sp,
    color: _palette.text,
  );

  TextStyle get nunitoLight14 => GoogleFonts.nunito(
    fontWeight: .w300,
    fontSize: 14.sp,
    color: _palette.text,
  );

  TextStyle get nunitoRegular12 => GoogleFonts.nunito(
    fontWeight: .w400,
    fontSize: 12.sp,
    color: _palette.text,
  );

  TextStyle get nunitoMedium11 => GoogleFonts.nunito(
    fontWeight: .w500,
    fontSize: 11.sp,
    color: _palette.text,
  );
}
