import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/back_ground_container.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/view/home/widgets/restaurant_tile.dart';

class AllNearByRestaurant extends StatelessWidget {
  const AllNearByRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "All Nearby Restaurant",
          style: appstyle(13, kDark, FontWeight.w500),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 12.w),
            child: ListView(
              children: List.generate(restaurants.length, (i) {
                var restaurant = restaurants[i];
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
