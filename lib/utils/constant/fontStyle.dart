import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
TextStyle roboto(Color textColor, double fontSize, FontWeight FontWeight) {
  return GoogleFonts.roboto(
      color: textColor, fontSize: fontSize, fontWeight: FontWeight);
}

TextStyle robotoCondensed(
    Color textColor, double fontSize, FontWeight FontWeight) {
  return GoogleFonts.robotoCondensed(
      color: textColor, fontSize: fontSize, fontWeight: FontWeight);
}
