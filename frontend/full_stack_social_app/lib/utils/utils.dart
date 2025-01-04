import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonUtils{

 TextStyle dynamicTextStyle({
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.normal,
  Color color = Colors.black,
}) {
  return GoogleFonts.roboto(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
}