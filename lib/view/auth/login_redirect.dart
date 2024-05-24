import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/custom_appbar.dart';
import 'package:fooodly/common/custom_button.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/view/auth/login_page.dart';
import 'package:fooodly/view/profile/profile_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "data",
          style: appstyle(12, kDark, FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
            containerContent: Column(
          children: [
            Container(
              width: width,
              height: height / 2,
              color: Colors.white,
              child: LottieBuilder.asset(
                "assets/anime/delivery,json",
                width: width,
                height: height / 2,
              ),
            ),
            CustomButton(
              btnWidth: width,
              text: "L O G I N",
              onTap: () {
                Get.to(() => const ProfilePage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900));
              },
            ),
          ],
        )),
      ),
    );
  }
}
