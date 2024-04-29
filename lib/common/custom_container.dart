import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/constants/constants.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.containerContent, this.color});

  Widget containerContent;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        child: Container(
          color: color ?? kOffWhite,
          width: width,
          child: SingleChildScrollView(
            child: containerContent,
          ),
        ),
      ),
    );
  }
}
