import 'package:ai_notes_uikit/ai_notes_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final String hint;
  final String error;
  final TextEditingController controller;

  const InputWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.error,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    var theme = CustomTheme.of(context);
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .start,
      spacing: 8.h,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: GoogleFonts.nunito(
              fontWeight: .w700,
              fontSize: 32.sp,
              color: theme.palette.text,
            ),
          ),
        TextField(
          cursorColor: theme.palette.accent,
          cursorWidth: 2.w,
          cursorHeight: 20.h,
          controller: controller,
          style: GoogleFonts.nunito(
            fontWeight: .w400,
            fontSize: 12.sp,
            color: theme.palette.text,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.palette.block,
            hintText: hint,
            hintStyle: GoogleFonts.nunito(
              fontWeight: .w400,
              fontSize: 12.sp,
              color: theme.palette.hint,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: (error.isNotEmpty)
                    ? theme.palette.error
                    : theme.palette.border,
                width: 1.r,
              ),
              borderRadius: .circular(10.r),
            ),
          ),
        ),
        if (error.isNotEmpty)
          Text(
            error,
            style: GoogleFonts.nunito(
              fontWeight: .w700,
              fontSize: 32.sp,
              color: theme.palette.error,
            ),
          ),
      ],
    );
  }
}
