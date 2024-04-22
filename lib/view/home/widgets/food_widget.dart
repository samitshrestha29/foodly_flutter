import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.price,
    this.onTap,
  });
  final String image;
  final String title;
  final String time;
  final String price;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.w),
      child: Container(
        width: width * .75,
        height: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: SizedBox(
                  height: 112.h,
                  width: width * 0.8,
                  child: Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: title,
                        style: appstyle(12, kDark, FontWeight.w500),
                      ),
                      ReusableText(
                        text: "\$ $price",
                        style: appstyle(12, kPrimary, FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Delivery time",
                        style: appstyle(12, kGray, FontWeight.w500),
                      ),
                      ReusableText(
                        text: time,
                        style: appstyle(9, kDark, FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
