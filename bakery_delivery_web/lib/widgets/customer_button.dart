import 'package:bakery_delivery_web/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({ Key? key, required this.buttonText }) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: active,
        borderRadius: BorderRadius.circular(30),       

      ),
      padding:const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Text(
        buttonText,
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color:  Colors.white
        ),
      ),
    );
  }
}