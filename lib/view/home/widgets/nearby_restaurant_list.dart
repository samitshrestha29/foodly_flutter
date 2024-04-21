import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/view/home/widgets/restaurant_widget.dart';

class NearbyRestaurant extends StatelessWidget {
  const NearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (i) {
          var restaurant = restaurants[i];
          return RestaurantWidget(
            image: restaurant['imageUrl'],
            logo: restaurant['logoUrl'],
            time: restaurant['time'],
            rating: restaurant["ratingCount"],
            text: 'Hello World',
          );
        }),
      ),
    );
  }
}
