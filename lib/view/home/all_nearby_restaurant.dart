import 'package:flutter/material.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';

class AllNearByRestaurant extends StatelessWidget {
  const AllNearByRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        title: ReusableText(
          text: "All Nearby Restaurant",
          style: appstyle(13, kDark, FontWeight.w500),
        ),
      ),
      body: const Center(
        child: Text("All Nearby Restaurant"),
      ),
    );
  }
}
