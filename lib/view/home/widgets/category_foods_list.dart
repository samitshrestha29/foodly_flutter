import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/shimmers/foodlist_shimmer.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/hooks/fetch_category_foods.dart';
import 'package:fooodly/models/foods_model.dart';
import 'package:fooodly/view/home/widgets/food_tile.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return SizedBox(
        width: width,
        height: height,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 12.w),
                child: ListView(
                  children: List.generate(foods!.length, (i) {
                    FoodsModel food = foods[i];
                    return FoodTile(
                      food: food,
                    );
                  }),
                ),
              ));
  }
}
