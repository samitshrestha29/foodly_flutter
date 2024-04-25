import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/back_ground_container.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/common/shimmers/foodlist_shimmer.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/hooks/fetch_all_foods.dart';
import 'package:fooodly/models/foods_model.dart';
import 'package:fooodly/view/home/widgets/food_tile.dart';

class Recomendation extends HookWidget {
  const Recomendation({super.key});

  @override
  Widget build(BuildContext context) {
    final hooksResults = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hooksResults.data;
    final isLoading = hooksResults.isLoading;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Recomendations",
          style: appstyle(13, kDark, FontWeight.w500),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                ),
        ),
      ),
    );
  }
}
