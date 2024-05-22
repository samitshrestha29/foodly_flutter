import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/common/profile_app_bar.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/constants/uidata.dart';
import 'package:fooodly/view/profile/widget/profile_tile_widget.dart';
import 'package:fooodly/view/profile/widget/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h), child: const ProfileAppBar()),
      body: SafeArea(
        child: CustomContainer(
            containerContent: Column(
          children: [
            Container(
              height: height * 0.06,
              width: width,
              color: kPrimary,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const UserInfoWidget(),
                      SizedBox(height: 10.h),
                      Container(
                        height: 210.h,
                        decoration: const BoxDecoration(
                          color: kLightWhite,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ProfileTileWidget(
                                onTap: () {},
                                title: "My Order",
                                icon: Ionicons.fast_food_outline),
                            ProfileTileWidget(
                                onTap: () {},
                                title: "My Favorite Places",
                                icon: Ionicons.heart_outline),
                            ProfileTileWidget(
                                onTap: () {},
                                title: "Review",
                                icon: Ionicons.chatbubble_outline),
                            ProfileTileWidget(
                                onTap: () {},
                                title: "Coupons",
                                icon: MaterialCommunityIcons.tag_outline),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
