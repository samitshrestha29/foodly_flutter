import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/shimmers/nearby_shimmer.dart';
import 'package:fooodly/hooks/fetch_foods.dart';
import 'package:fooodly/models/foods_model.dart';
import 'package:fooodly/view/food/food_page.dart';
import 'package:fooodly/view/home/widgets/food_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 180.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                  onTap: () {
                    Get.to(() => FoodPage(food: food));
                  },
                  image: food.imageUrl[0],
                  title: food.title,
                  time: food.time,
                  price: food.price.toStringAsFixed(2),
                );
              }),
            ),
    );
  }
}
