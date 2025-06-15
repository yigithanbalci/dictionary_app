import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/favorites_tab_controller.dart';

class FavoritesTabView extends GetView<FavoritesTabController> {
  const FavoritesTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: SizedBox(
        height: 658.h,
        width: 375.w,
        child: Column(
          children: [
            Container(
              height: 80.h,
              width: 343.w,
              color: const Color(0xFFEFF4FE),
              child: Row(
                children: [
                  Container(
                    height: 72.h,
                    width: 72.w,
                    color: const Color(0xFFFFFFFF),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
