import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/custom_button.dart';
import 'package:fooodly/common/custom_text_field.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/controllers/foods_controller.dart';
import 'package:fooodly/controllers/login_controller.dart';
import 'package:fooodly/hooks/fetch_restaurant.dart';
import 'package:fooodly/models/foods_model.dart';
import 'package:fooodly/models/login_response.dart';
import 'package:fooodly/view/auth/login_page.dart';
import 'package:fooodly/view/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

import '../auth/phone_verification_page.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});
  final FoodsModel food;
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _preferences = TextEditingController();
  final PageController _pageController = PageController();

  late final FoodController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadAdditives(widget.food.additives);
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final hookResult = useFetchRetaurant(widget.food.restaurant);
    final loginController = Get.put(LoginController());

    user = loginController.getUserInfo();
    return Scaffold(
      body: ListView(
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
                        controller: _pageController,
                        onPageChanged: (i) {
                          controller.changePage(i);
                        },
                        itemCount: widget.food.imageUrl.length,
                        itemBuilder: (context, i) {
                          return Container(
                            width: double.infinity,
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
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(widget.food.imageUrl.length,
                              (index) {
                            return Container(
                              margin: const EdgeInsets.only(left: 12.0),
                              width: 10.w,
                              height: 10.w,
                              decoration: BoxDecoration(
                                color: controller.currentPage == index
                                    ? kSecondary
                                    : kGrayLight,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40.h,
                      left: 12.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Ionicons.chevron_back_circle,
                          color: kPrimary,
                          size: 30,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 15.w,
                      child: CustomButton(
                        onTap: () {
                          Get.to(() =>
                              RestaurantPage(restaurant: hookResult.data));
                        },
                        btnWidth: 120.w,
                        btnHeight: 25.h,
                        text: 'Open Restaurant',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      alignment: TextAlign.left,
                      text: widget.food.title,
                      style: appstyle(18, kDark, FontWeight.w600),
                    ),
                    Obx(
                      () => ReusableText(
                        alignment: TextAlign.left,
                        text:
                            "\$ ${((widget.food.price + controller.additivePrice) * controller.count.value).toStringAsFixed(2)}",
                        style: appstyle(18, kPrimary, FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  widget.food.description,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: appstyle(11, kDark, FontWeight.w400),
                ),
                SizedBox(
                  height: 18.h,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children:
                          List.generate(widget.food.foodTags.length, (index) {
                        final tag = widget.food.foodTags[index];
                        return Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: ReusableText(
                              alignment: TextAlign.left,
                              text: tag,
                              style: appstyle(11, kWhite, FontWeight.w400),
                            ),
                          ),
                        );
                      })),
                ),
                SizedBox(height: 15.h),
                ReusableText(
                  alignment: TextAlign.left,
                  text: "Additives and Toppings",
                  style: appstyle(18, kDark, FontWeight.w600),
                ),
                SizedBox(height: 10.h),
                Obx(
                  () {
                    if (controller.additivesList.isEmpty) {
                      return Text(
                        "No additives available",
                        style: appstyle(14, kGrayLight, FontWeight.w400),
                      );
                    }
                    return Column(
                      children:
                          List.generate(widget.food.additives.length, (index) {
                        if (index >= controller.additivesList.length) {
                          return const SizedBox
                              .shrink(); // Avoid index out of range
                        }
                        final additive = controller.additivesList[index];
                        return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          activeColor: kSecondary,
                          value: additive.isChecked.value,
                          tristate: false,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                alignment: TextAlign.left,
                                text: additive.title,
                                style: appstyle(14, kDark, FontWeight.w400),
                              ),
                              SizedBox(width: 5.w),
                              ReusableText(
                                alignment: TextAlign.left,
                                text: "\$ ${additive.price}",
                                style: appstyle(11, kPrimary, FontWeight.w600),
                              ),
                            ],
                          ),
                          onChanged: (bool? value) {
                            additive.toggleChecked();
                            controller.getTotalPrice();
                          },
                        );
                      }),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      alignment: TextAlign.left,
                      text: "Quantity",
                      style: appstyle(18, kDark, FontWeight.bold),
                    ),
                    SizedBox(width: 5.w),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.increment();
                          },
                          child: const Icon(AntDesign.pluscircleo),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Obx(
                            () => ReusableText(
                              alignment: TextAlign.left,
                              text: "${controller.count.value}",
                              style: appstyle(14, kDark, FontWeight.w600),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.decrement();
                          },
                          child: const Icon(AntDesign.minuscircleo),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ReusableText(
                  alignment: TextAlign.left,
                  text: "Preferences ",
                  style: appstyle(18, kDark, FontWeight.w600),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 120.h,
                  child: CustomTextWidget(
                    hintText:
                        "Please enter your preferences and we will try to make it happen",
                    controller: _preferences,
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (user == null) {
                            Get.to(() => const LoginPage());
                          } else if (user.phoneverification == false) {
                            showVerificationSheet(context);
                          } else {
                            print("Place Order");
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: ReusableText(
                            alignment: TextAlign.center,
                            text: "Place Order",
                            style: appstyle(18, kLightWhite, FontWeight.w600),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          backgroundColor: kSecondary,
                          radius: 20.r,
                          child: const Icon(
                            Ionicons.cart,
                            color: kLightWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          height: 510.h,
          width: width,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/restaurant_bk.png"),
              fit: BoxFit.fill,
            ),
            color: kLightWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                ReusableText(
                  alignment: TextAlign.center,
                  text: 'Verify Your Number',
                  style: appstyle(18, kPrimary, FontWeight.w600),
                ),
                SizedBox(
                  height: 300.h,
                  child: Column(
                    children:
                        List.generate(verificationReasons.length, (index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.check_circle_outline,
                          color: kPrimary,
                        ),
                        title: Text(
                          verificationReasons[index],
                          style: appstyle(11, kGrayLight, FontWeight.normal),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomButton(
                  btnHeight: 40,
                  text: "Verify Phone Number",
                  btnWidth: width,
                  onTap: () {
                    Get.to(() => const PhoneVerificationPage());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
