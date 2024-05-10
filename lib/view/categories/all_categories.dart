import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/back_ground_container.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/common/shimmers/foodlist_shimmer.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/hooks/fetch_all_categories.dart';
import 'package:fooodly/models/categories.dart';
import 'package:fooodly/view/categories/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: 'All Categories',
          style: appstyle(12, Colors.black87, FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Container(
                padding: EdgeInsets.only(left: 12.w, top: 10.h),
                height: height,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories!.length, (i) {
                    CategoriesModel category = categories[i];
                    return CategoryTile(category: category);
                  }),
                ),
              ),
      ),
    );
  }
}
