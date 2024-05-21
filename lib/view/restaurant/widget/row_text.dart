import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: first,
          style: appstyle(10, kGray, FontWeight.w500),
        ),
        ReusableText(
          text: second,
          style: appstyle(10, kGray, FontWeight.w500),
        ),
      ],
    );
  }
}
