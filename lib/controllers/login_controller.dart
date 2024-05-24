import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/api_error.dart';
import 'package:fooodly/models/login_response.dart';
import 'package:fooodly/view/auth/verification_page.dart';
import 'package:fooodly/view/profile/profile_page.dart'; // Import ProfilePage
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final box = GetStorage();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool newState) {
    _isLoading.value = newState;
  }

  Future<void> loginFunction(String data) async {
    isLoading = true;

    Uri url = Uri.parse("$appBaseUrl/login");
    Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        LoginResponse loginData = LoginResponse.fromJson(responseData);
        box.write('userData', jsonEncode(loginData));
        box.write('token', loginData.userToken);
        box.write('verification', loginData.verification);
        isLoading = false;
        Get.snackbar(
          "You are successfully logged in",
          "Enjoy your awesome experience",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(Ionicons.fast_food_outline),
        );

        if (!loginData.verification) {
          Get.offAll(() => const VerificationPage(),
              transition: Transition.fade,
              duration: const Duration(milliseconds: 900));
        } else {
          Get.offAll(() => const ProfilePage(), // Redirect to ProfilePage
              transition: Transition.fade,
              duration: const Duration(milliseconds: 900));
        }
      } else {
        var error = apiErrorFromJson(response.body);
        isLoading = false;
        Get.snackbar("Failed to login", error.message,
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      isLoading = false;
      Get.snackbar("Error", "An error occurred: $e",
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: const Icon(Icons.error_outline));
      debugPrint(e.toString());
    }
  }

  void logout() {
    box.erase();
    Get.offAll(() => const ProfilePage(), // Redirect to ProfilePage on logout
        transition: Transition.fade,
        duration: const Duration(milliseconds: 900));
  }
}
