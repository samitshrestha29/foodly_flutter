import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooodly/controllers/phone_verification_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:flutter/foundation.dart'; // for debugPrint

class VerificationService {
  final controller = Get.put(PhoneVerificationController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber,
      {required void Function(String verificationId, int? resendToken)
          codeSent}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credentials) async {
        controller.verifyPhone();
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        codeSent(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle the auto retrieval timeout if needed
      },
    );
  }

  Future<void> verifySmsCode(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    await _auth.signInWithCredential(credential).then((value) {
      controller.verifyPhone();
    });
  }
}
