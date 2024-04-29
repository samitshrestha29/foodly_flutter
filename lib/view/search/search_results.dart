import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/search_controller.dart';
import 'package:fooodly/models/foods_model.dart';
import 'package:fooodly/view/home/widgets/food_tile.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
        itemCount: controller.searchResults!.length,
        itemBuilder: (context, i) {
          FoodsModel food = controller.searchResults![i];
          return FoodTile(food: food);
        },
      ),
    );
  }
}
