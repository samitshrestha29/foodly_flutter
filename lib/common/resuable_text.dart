import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ReusableText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

TextStyle appstyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}
