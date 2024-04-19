import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/controllers/category_controller.dart';
import 'package:fooodly/view/categories/all_categories.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (i) {
          var category = categories[i];
          return GestureDetector(
            onTap: () {
              if (controller.categoryValue == category['_id']) {
                controller.updateCategory = '';
                controller.updatetitle = '';
              } else if (category['value'] == 'more') {
                Get.to(() => const AllCategories(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900));
              } else {
                controller.updateCategory = category['_id'];
                controller.updatetitle = category['title'];
              }
            },
            child: Container(
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
            ),
          );
        }),
      ),
    );
  }
}
