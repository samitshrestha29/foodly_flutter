import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooodly/common/custom_appbar.dart';
import 'package:fooodly/common/custom_container.dart';
import 'package:fooodly/view/home/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppbar()),
      body: SafeArea(
        child: CustomContainer(
            containerContent: const Column(
          children: [CategoryList()],
        )),
      ),
    );
  }
}
