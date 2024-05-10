import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/custom_appbar.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/common/heading.dart';
import 'package:fooodly/controllers/category_controller.dart';
import 'package:fooodly/view/home/all_fastest_food.dart';
import 'package:fooodly/view/home/all_nearby_restaurant.dart';
import 'package:fooodly/view/home/recommendation_page.dart';
import 'package:fooodly/view/home/widgets/category_foods_list.dart';
import 'package:fooodly/view/home/widgets/category_list.dart';
import 'package:fooodly/view/home/widgets/food_list.dart';
import 'package:fooodly/view/home/widgets/nearby_restaurant_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppbar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Obx(
                () => controller.categoryValue == ''
                    ? Column(
                        children: [
                          Heading(
                            text: "Nearby Restaurant",
                            onTap: () {
                              Get.to(() => const AllNearByRestaurant(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900));
                            },
                          ),
                          const NearbyRestaurant(),
                          Heading(
                            text: "Try Something New",
                            onTap: () {
                              Get.to(() => const Recomendation(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900));
                            },
                          ),
                          const FoodList(),
                          Heading(
                            text: "Food Closer To You",
                            onTap: () {
                              Get.to(() => const AllFastestFoods(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900));
                            },
                          ),
                          const FoodList(),
                        ],
                      )
                    : CustomContainer(
                        containerContent: Column(
                        children: [
                          Heading(
                            more: true,
                            text: "Explore ${controller.titleValue} Category",
                            onTap: () {
                              Get.to(() => const Recomendation(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900));
                            },
                          ),
                          const CategoryFoodsList()
                        ],
                      )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
