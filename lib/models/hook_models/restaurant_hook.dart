import 'dart:ui';

import 'package:fooodly/models/restaurants_model.dart';

class FetchRestaurant {
  final RestaurantsModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchRestaurant(
      {required this.data,
      required this.isLoading,
      required this.error,
      required this.refetch});
}
