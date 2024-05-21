import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/custom_button.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/restaurants_model.dart';
import 'package:fooodly/view/restaurant/rating_page.dart';
import 'package:get/get.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.restaurant,
  });

  final RestaurantsModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(0.3),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
            itemCount: 5,
            itemSize: 25,
            rating: restaurant.rating.toDouble(),
            itemBuilder: (context, i) => const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ),
          CustomButton(
            btnColor: kSecondary,
            btnWidth: MediaQuery.of(context).size.width / 3,
            text: "Rate Restaurant",
            onTap: () {
              Get.to(() => const RatingPage());
            },
          ),
        ],
      ),
    );
  }
}
