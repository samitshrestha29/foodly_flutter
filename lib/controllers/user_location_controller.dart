import 'dart:convert';
import 'package:fooodly/constants/constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class UserLocationController extends GetxController {
  LatLng position = const LatLng(0, 0);

  void setPosition(LatLng value) {
    position = value;
    update();
  }

  final RxString _address = ''.obs;

  String get address => _address.value;

  set setAddress(String value) {
    _address.value = value;
  }

  final RxString _postalCode = ''.obs;

  String get postalCode => _postalCode.value;

  set setPostalCode(String value) {
    _postalCode.value = value;
  }

  void getUserAddress(LatLng position) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey");

    print(
        'Fetching address for coordinates: ${position.latitude}, ${position.longitude}');

    try {
      final response = await http.get(url);
      print('Geocoding API response status: ${response.statusCode}');
      print('Geocoding API response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['results'].isNotEmpty) {
          final address = responseBody['results'][0]['formatted_address'];
          setAddress = address;

          final addressComponents =
              responseBody['results'][0]['address_components'];

          for (var component in addressComponents) {
            if (component['types'].contains('postal_code')) {
              setPostalCode = component['long_name'];
            }
          }
        } else {
          setAddress = 'No address found';
          setPostalCode = 'No postal code found';
        }
      } else {
        setAddress = 'Failed to fetch address';
        setPostalCode = 'Failed to fetch postal code';
        print('Failed to fetch address: ${response.statusCode}');
      }
    } catch (e) {
      setAddress = 'Error fetching address';
      setPostalCode = 'Error fetching postal code';
      print('Error fetching address: $e');
    }
  }
}
