import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/foods_model.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});
  final FoodsModel food;
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.food.imageUrl);
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30.r)),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 230.h,
                      child: PageView.builder(
                        itemCount: widget.food.imageUrl.length,
                        itemBuilder: (context, i) {
                          print(widget.food.imageUrl.length);
                          return Container(
                            width: width,
                            height: 230.h,
                            color: kLightWhite,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.food.imageUrl[i],
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(widget.food.imageUrl.length, (index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 12.0),
                            width: 10.w,
                            height: 10.w,
                            decoration: const BoxDecoration(
                              color: kSecondary,
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
