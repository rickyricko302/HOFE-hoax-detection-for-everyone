import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NunitoText extends StatelessWidget {
  const NunitoText(
      {super.key,
      required this.text,
      required this.fontSize,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.maxLines,
      this.textAlign = TextAlign.left});
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: GoogleFonts.nunito(
          color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
