import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/constants/uidata.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (i) {
          var category = categories[i];

          return Container(
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.only(top: 4.h),
            width: width * 0.19,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: kSecondary, width: .5.w)),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                  child: Image.network(
                    category['imageUrl'],
                    fit: BoxFit.contain,
                  ),
                ),
                ReusableText(
                  text: category['title'],
                  style: appstyle(12, kDark, FontWeight.normal),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
