import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

double calculateHeightText(String Text, double width){
  final TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: Text,
      style: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400
      )
    ),
    maxLines: null,
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: width);

  return textPainter.size.height;
}