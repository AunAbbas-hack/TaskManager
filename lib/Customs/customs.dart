import 'dart:ui';

import 'package:aunproject1/Customs/constants.dart';
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
  static customTextField(
       {required String hintText,
       required TextEditingController controller
       }
       ){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle,
      ),
    );
   }
   static noteText({required String text,required TextStyle styleText}){
    return Text(text,style: styleText,);
   }
}
