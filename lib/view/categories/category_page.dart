import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/back_ground_container.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/common/shimmers/foodlist_shimmer.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/category_controller.dart';
import 'package:fooodly/hooks/fetch_category_foods.dart';
import 'package:fooodly/models/foods_model.dart';
import 'package:fooodly/view/home/widgets/food_tile.dart';
import 'package:get/get.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          leading: IconButton(
            onPressed: () {
              controller.updateCategory = '';
              controller.updateTitle = '';
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kDark,
            ),
            color: kGray,
          ),
          title: ReusableText(
            text: "${controller.titleValue} Category",
            style: appstyle(13, kGray, FontWeight.w600),
            alignment: TextAlign.left,
          )),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 12.w),
                  child: ListView(
                    children: List.generate(foods!.length, (i) {
                      FoodsModel food = foods[i];
                      return FoodTile(
                        color: Colors.white,
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
