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
            FavoritesCard(
              favoritesList: FavoritesList(
                language: "English",
                listName: "Default List",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> FavoritesBottomSheet() {
  return Get.bottomSheet(
    Container(
      height: 274.h,
      width: 375.w,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 64.h,
            width: 375.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Center(
                child: Text(
                  "Be Aware!",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF000000),
                    fontFamily: 'UberMove',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 120.h,
            width: 375.w,
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.w),
            child: Row(
              children: [
                SizedBox(
                  height: 48.h,
                  width: 255.w,
                  child: Text(
                    "You can add, play or delete quizzes from this page!",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF000000),
                      fontFamily: 'UberMove',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                Expanded(child: Container()),
                SizedBox(
                  height: 72.h,
                  width: 72.w,
                  child: Image.asset(
                    "assets/icons/warning_info.png",
                    height: 68.h,
                    width: 60.w,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 90.h,
            width: 375.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    height: 56.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xFFFFFFFF),
                          fontFamily: 'UberMove',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                34.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    ),
    barrierColor: Colors.black54, // Background overlay color
    isDismissible: true, // Can be dismissed by tapping outside
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}

class FavoritesList {
  const FavoritesList({required this.language, required this.listName});

  final String language;
  final String listName;
}

class FavoritesCard extends StatelessWidget {
  const FavoritesCard({super.key, required this.favoritesList});
  final FavoritesList favoritesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 343.w,
      color: const Color(0xFFEFF4FE),
      child: Row(
        children: [
          SizedBox(
            height: 72.h,
            width: 72.w,
            child: Center(
              child: Image.asset(
                'assets/icons/favorites_item.png',
                width: 40.w,
                height: 40.h,
              ),
            ),
          ),
          Column(
            children: [
              16.verticalSpace,
              SizedBox(
                height: 20.h,
                width: 255.w,
                child: Text(
                  favoritesList.language,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF000000),
                    fontFamily: 'UberMove',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              4.verticalSpace,
              SizedBox(
                height: 24.h,
                width: 255.w,
                child: Text(
                  favoritesList.listName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xFF000000),
                    fontFamily: 'UberMove',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              16.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
