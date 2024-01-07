import 'package:flutter/material.dart';
import 'package:food_funda_business/components/common/common_ui/color_funda.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleFunda {
  static final TextStyleFunda _instance = TextStyleFunda._internal();
  factory TextStyleFunda() {
    return _instance;
  }
  TextStyleFunda._internal();

  final TextStyle loginHeaderStyle = GoogleFonts.epilogue(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: ColorFunda().primaryBlack,
  );

  final TextStyle buttonTextStyle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorFunda().primaryBlack,
  );

  final TextStyle textFieldErrorStyle = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorFunda().errorRed,
  );
  
  final TextStyle secondaryTextStyle = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: ColorFunda().secondaryGray,
  );
   
  final TextStyle infoTextStyle = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorFunda().primaryBlack,
  );
}
