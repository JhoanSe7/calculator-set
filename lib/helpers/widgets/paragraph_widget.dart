import 'package:flutter/material.dart';

class ParagraphWidget extends StatelessWidget {
  final String content;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const ParagraphWidget(
    this.content, {
    super.key,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 18,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
