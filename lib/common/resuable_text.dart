import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? alignment;
  const ReusableText({
    super.key,
    required this.text,
    required this.style,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      textAlign: alignment,
      style: style,
    );
  }
}
