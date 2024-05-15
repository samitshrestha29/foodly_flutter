import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/constants/constants.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      this.keyboardType,
      this.controller,
      this.obscureText = false,
      this.suffixIcon,
      this.validator,
      this.prefixIcon,
      this.hintText,
      this.maxLines});

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: kGray, width: 0.4),
        color: kOffWhite,
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextFormField(
        maxLines: maxLines ?? 1,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorHeight: 20.h,
        style: appstyle(11, kDark, FontWeight.normal),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: appstyle(11, kDark, FontWeight.normal),
          suffixIcon: suffixIcon,
          prefix: prefixIcon,
        ),
      ),
    );
  }
}
