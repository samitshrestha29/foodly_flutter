import 'package:fooodly/view/entrypoint.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/api_error.dart';
import 'package:fooodly/models/login_response.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PhoneVerificationController extends GetxController {
  final box = GetStorage();

  String _phone = "";

  String get phone => _phone;

  set setPhoneNumber(String value) {
    _phone = value;
    print(phone);
  }

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  Future<void> verifyPhone() async {
    setLoading = true;
    String accessToken = box.read("token");
    Uri url = Uri.parse("$appBaseUrl/api/users/verify_phone/$phone");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        LoginResponse data = loginResponseFromJson(response.body);
        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write("token", data.userToken);
        box.write("userId", data.id); // Fixed key
        box.write("verification", data.verification);

        setLoading = false;

        Get.snackbar(
          "You are successfully Verified",
          "Enjoy your awesome Experience",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(Ionicons.fast_food_outline),
        );
        Get.back();
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar("Failed to Verify account ", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(Icons.error_outline));
        Get.offAll(() => MainScreen());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
