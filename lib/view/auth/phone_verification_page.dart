import 'package:flutter/material.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/phone_verification_controller.dart';
import 'package:get/get.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: Colors.blueAccent,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: appstyle(20, kDark, FontWeight.bold),
      textColor: kDark,
      onSend: (String value) {
        controller.setPhoneNumber = value;
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }
}
