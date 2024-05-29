import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fooodly/common/custom_button.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/login_controller.dart';
import 'package:fooodly/models/login_response.dart';
import 'package:fooodly/view/auth/login_page.dart';
import 'package:fooodly/view/auth/login_redirect.dart';
<<<<<<< HEAD
import 'package:fooodly/view/auth/verification_page.dart';
=======
>>>>>>> ac0b701506f6aa5c7cb423de398b19280ef3b37f
import 'package:fooodly/view/profile/widget/profile_app_bar.dart';
import 'package:fooodly/view/profile/widget/profile_tile_widget.dart';
import 'package:fooodly/view/profile/widget/user_info_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());
    final box = GetStorage();
    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null || user == null) {
      return const LoginRedirect();
    }

<<<<<<< HEAD
    if (user.verification == false) {
      return const VerificationPage();
    }

=======
>>>>>>> ac0b701506f6aa5c7cb423de398b19280ef3b37f
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h), child: const ProfileAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              UserInfoWidget(user: user),
              Column(
                children: [
                  SizedBox(height: 10.h),
                  Container(
                    height: 180.h,
                    decoration: const BoxDecoration(
                      color: kLightWhite,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                            onTap: () {
                              Get.to(() => const LoginPage(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900));
                            },
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
                  const SizedBox(height: 15),
                  Container(
                    height: 180.h,
                    decoration: const BoxDecoration(
                      color: kLightWhite,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                            onTap: () {},
                            title: "Shipping Address",
                            icon: SimpleLineIcons.location_pin),
                        ProfileTileWidget(
                            onTap: () {},
                            title: "Service Center",
                            icon: AntDesign.customerservice),
                        ProfileTileWidget(
                            onTap: () {},
                            title: "Coupons",
                            icon: MaterialIcons.rss_feed),
                        ProfileTileWidget(
                            onTap: () {},
                            title: "Settings",
                            icon: AntDesign.setting),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onTap: () {
                      controller.logout();
                    },
                    btnWidth: MediaQuery.of(context).size.width,
                    text: "Logout",
                    radius: 0,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
