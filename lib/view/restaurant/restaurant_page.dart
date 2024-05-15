import 'package:flutter/material.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/restaurants_model.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});
  final RestaurantsModel? restaurant;
  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.restaurant!.coords.address);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGray,
      ),
      body: Container(),
    );
  }
}
