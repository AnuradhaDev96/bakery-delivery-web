import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.textSize,
      this.textColor,
      this.fontWeight,
      this.underline})
      : super(key: key);

  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? underline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        fontStyle: FontStyle.normal,
        fontSize: textSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        textStyle: TextStyle(
          color: textColor ?? Colors.black,
          decoration: underline != null
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
