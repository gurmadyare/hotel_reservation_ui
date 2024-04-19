import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double height;
  final FontWeight fontWeight;
  const BigText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 28,
    this.height = 1.2,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        height: height,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
