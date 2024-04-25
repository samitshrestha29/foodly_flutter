import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/shimmers/nearby_shimmer.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/hooks/fetch_restaurants.dart';
import 'package:fooodly/models/restaurants_model.dart';
import 'package:fooodly/view/home/widgets/restaurant_widget.dart';

class NearbyRestaurant extends HookWidget {
  const NearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRetaurants("41007428");
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 192.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurants!.length, (i) {
                var restaurant = restaurants[i];
                return RestaurantWidget(
                  image: restaurant.imageUrl,
                  logo: restaurant.logoUrl,
                  time: restaurant.time,
                  rating: "75256",
                  text: restaurant.title,
                );
              }),
            ),
    );
  }
}
