import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/login_controller.dart';
import 'package:fooodly/models/login_response.dart';
import 'package:fooodly/view/auth/login_redirect.dart';
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

    if (token == null || user == null) {
      return const LoginRedirect();
    }
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
