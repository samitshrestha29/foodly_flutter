import 'package:flutter/material.dart';

import 'package:fooodly/models/foods_model.dart';

class FetchFoods {
  final List<FoodsModel>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchFoods({
    required this.data,
    this.isLoading = false,
    this.error,
    this.refetch,
  });
}
