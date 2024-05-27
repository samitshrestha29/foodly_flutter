import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/app_style.dart';
import 'package:fooodly/common/resuable_text.dart';
import 'package:fooodly/constants/constants.dart';
import 'package:fooodly/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  final LoginResponse user;
  const UserInfoWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.08,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(user.profile),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: user.username,
                          style: appstyle(12, kGray, FontWeight.w600)),
                      ReusableText(
                          text: user.email,
                          style: appstyle(12, kGray, FontWeight.w600)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit button press
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
