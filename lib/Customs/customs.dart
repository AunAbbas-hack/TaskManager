import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Uihelper {
  static customText({
    required String text,
    required double size,
    required Color color,
    required FontWeight fontWeight,
    TextAlign? textAligh,
    TextDecoration? textDecoration
  }) {
    return Text(
      text,
      textAlign: textAligh,
      style: GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        decoration: textDecoration,
      ),
    );
  }
}
