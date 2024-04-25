import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/back_ground_container.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/common/shimmers/foodlist_shimmer.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/hooks/fetch_all_restaurants.dart';
import 'package:fooodly/models/restaurants_model.dart';
import 'package:fooodly/view/home/widgets/restaurant_tile.dart';

class AllNearByRestaurant extends HookWidget {
  const AllNearByRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRetaurants("41007428");
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Nearby Restaurants",
          style: appstyle(13, kDark, FontWeight.w500),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 12.w),
                  child: ListView(
                    children: List.generate(restaurants!.length, (i) {
                      RestaurantsModel restaurant = restaurants[i];
                      return RestaurantTile(
                        restaurant: restaurant,
                      );
                    }),
                  ),
                ),
              ),
      ),
    );
  }
}
