import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/restaurants_model.dart';
import 'package:fooodly/view/restaurant/widget/restaurant_menu.dart';
import 'package:fooodly/view/restaurant/widget/row_text.dart';
import 'package:fooodly/view/restaurant/widget/xplore_widget.dart';
import 'widget/restaurant_bottom_bar.dart';
import 'widget/restaurant_top_bar.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});
  final RestaurantsModel? restaurant;
  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    print(widget.restaurant!.coords.address);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.restaurant!.imageUrl,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: RestaurantBottomBar(
                    restaurant: widget.restaurant!,
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 0,
                  right: 0,
                  child: RestaurantTopBar(restaurant: widget.restaurant!),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  const RowText(
                      first: "Distance to Restaurant", second: "2.7 km"),
                  SizedBox(height: 3.h),
                  const RowText(first: "Estimated Price", second: "\$2.7"),
                  SizedBox(height: 3.h),
                  const RowText(first: "Estimated Time", second: "30 min"),
                  const Divider(
                    thickness: 0.5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                height: 25.h,
                width: width,
                decoration: BoxDecoration(
                  color: kOffWhite,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: kLightWhite,
                  labelStyle: appstyle(12, kLightWhite, FontWeight.normal),
                  unselectedLabelColor: kGrayLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25,
                        child: const Center(
                          child: Text("Menu"),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25,
                        child: const Center(
                          child: Text("Explore"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(controller: _tabController, children: [
                  RestaurantMenuWidget(restaurantId: widget.restaurant!.id),
                  XploreWidget(code: widget.restaurant!.code)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
