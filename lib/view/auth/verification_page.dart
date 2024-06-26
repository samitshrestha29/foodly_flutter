import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/custom_button.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/verification_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: ReusableText(
          text: "Please Verify Your Account",
          style: appstyle(12, kGray, FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: CustomContainer(
          color: Colors.white,
          containerContent: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Lottie.asset("assets/anime/delivery.json"),
                  SizedBox(height: 10.h),
                  Center(
                    child: ReusableText(
                      text: "Please Verify Your Account",
                      style: appstyle(20, kPrimary, FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Enter the 6-digit code sent to your email, if you don't see the code please check spam folder",
                    textAlign: TextAlign.justify,
                    style: appstyle(10, kGray, FontWeight.normal),
                  ),
                  SizedBox(height: 5.h),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: kPrimary,
                    borderWidth: 2.0,
                    textStyle: appstyle(17, kDark, FontWeight.w600),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    onSubmit: (String verificationCode) {
                      controller.setCode = verificationCode;
                      print(verificationCode);
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    btnHeight: 35.h,
                    btnWidth: width,
                    text: "V E R I F Y   A C C O U N T",
                    onTap: () {
                      controller.verificationFunction(controller.code);
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
