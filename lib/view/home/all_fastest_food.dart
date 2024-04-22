import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/back_ground_container.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/view/home/widgets/food_list.dart';
import 'package:fooodly/view/home/widgets/food_tile.dart';
import 'package:fooodly/view/home/widgets/restaurant_tile.dart';

class AllFastestFoods extends StatelessWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOffWhite,
        elevation: 0.3,
        title: ReusableText(
          text: "All Fastest Foods",
          style: appstyle(13, kDark, FontWeight.w500),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 12.w),
            child: ListView(
              children: List.generate(foods.length, (i) {
                var food = foods[i];
                return FoodTile(
                  food: food,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
