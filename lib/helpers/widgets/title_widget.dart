import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String content;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool shadow;

  const TitleWidget(
    this.content, {
    super.key,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.shadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        shadows: [if (shadow) const Shadow(color: Colors.black, offset: Offset(0, 0), blurRadius: 3)],
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
