import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/shimmers/categories_shimmer.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/hooks/fetch_catgories.dart';
import 'package:fooodly/models/categories.dart';
import 'package:fooodly/view/home/widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel> categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Container(
      height: 75.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const CatergoriesShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoriesList.length, (i) {
                CategoriesModel category = categoriesList[i];
                return CategoryWidget(category: category);
              }),
            ),
    );
  }
}
