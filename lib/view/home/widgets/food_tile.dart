import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/foods_model.dart';
import 'package:fooodly/view/food/food_page.dart';
import 'package:get/get.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, this.color});
  final FoodsModel food;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FoodPage(food: food));
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 70,
            width: width,
            decoration: BoxDecoration(
              color: color ?? kOffWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(2.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.network(
                            food.imageUrl[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                            color: kGray.withOpacity(0.5),
                            height: 16.h,
                            width: width,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemBuilder: (context, i) => const Icon(
                                Icons.star,
                                color: kSecondary,
                              ),
                              itemSize: 15.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: food.title,
                        style: appstyle(11, kDark, FontWeight.w400),
                      ),
                      ReusableText(
                        text: "Delivery time:${food.time}",
                        style: appstyle(11, kGray, FontWeight.w400),
                      ),
                      SizedBox(
                          width: width * 0.6,
                          height: 16.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: food.additives.length,
                              itemBuilder: (context, i) {
                                var addittive = food.additives[i];
                                return Container(
                                  margin: EdgeInsets.only(right: 5.w),
                                  decoration: BoxDecoration(
                                    color: kSecondary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9.r),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: ReusableText(
                                        text: addittive.title,
                                        style:
                                            appstyle(8, kDark, FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                );
                              }))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60.w,
              height: 19.h,
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: "\$ ${food.price.toStringAsFixed(2)}",
                  style: appstyle(12, kLightWhite, FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            right: 75.w,
            top: 6.h,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 19.w,
                height: 19.h,
                decoration: BoxDecoration(
                  color: kSecondary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Icon(
                    MaterialCommunityIcons.cart_plus,
                    size: 15.h,
                    color: kLightWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
