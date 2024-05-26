import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/back_ground_container.dart';
import 'package:fooodly/common/custom_button.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/registration_controller.dart';
import 'package:fooodly/models/registration_model.dart';
import 'package:fooodly/view/auth/widget/email_textfield.dart';
import 'package:fooodly/view/auth/widget/password_textfield.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _userController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimary,
          title: Center(
            child: ReusableText(
              text: "Foodly Family",
              style: appstyle(20, kLightWhite, FontWeight.bold),
            ),
          ),
        ),
        body: BackGroundContainer(
          color: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Lottie.asset("assets/anime/delivery.json"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      EmailTextField(
                        hintText: "User Name",
                        prefixIcon: const Icon(
                          CupertinoIcons.profile_circled,
                          size: 20,
                          color: kGrayLight,
                        ),
                        controller: _userController,
                      ),
                      SizedBox(height: 30.h),
                      EmailTextField(
                        hintText: "Enter Email",
                        prefixIcon: const Icon(
                          CupertinoIcons.mail,
                          size: 20,
                          color: kGrayLight,
                        ),
                        controller: _emailController,
                      ),
                      SizedBox(height: 25.h),
                      PasswordTextField(
                        controller: _passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: ReusableText(
                                  text: "Register",
                                  style: appstyle(
                                      12, Colors.blue, FontWeight.normal)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomButton(
                        btnHeight: 35.h,
                        btnWidth: width,
                        text: "Register",
                        onTap: () {
                          if (_emailController.text.isNotEmpty &&
                              _userController.text.isNotEmpty &&
                              _passwordController.text.length >= 8) {
                            RegistrationModel model = RegistrationModel(
                                username: _userController.text,
                                email: _emailController.text,
                                password: _passwordController.text);
                            String data = registrationModelToJson(model);
                            controller.registrationFunction(data);
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
