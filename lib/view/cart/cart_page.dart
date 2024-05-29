import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/login_controller.dart';
import 'package:fooodly/models/login_response.dart';
import 'package:fooodly/view/auth/login_redirect.dart';
<<<<<<< HEAD
import 'package:fooodly/view/auth/verification_page.dart';
=======
>>>>>>> ac0b701506f6aa5c7cb423de398b19280ef3b37f
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  LoginResponse? user;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final box = GetStorage();
    String? token = box.read('token');

<<<<<<< HEAD
    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null || user == null) {
      return const LoginRedirect();
    }

    if (user?.verification == false) {
      return const VerificationPage();
    }

=======
    if (token == null || user == null) {
      return const LoginRedirect();
    }
>>>>>>> ac0b701506f6aa5c7cb423de398b19280ef3b37f
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(
          height: 130,
        ),
      ),
      body: SafeArea(
        child: CustomContainer(containerContent: Container()),
      ),
    );
  }
}
