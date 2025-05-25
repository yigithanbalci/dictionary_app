import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/search_tab_controller.dart';

class SearchTabView extends GetView<SearchTabController> {
  const SearchTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 658.h,
      width: 375.w,
      // padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          TextInputField(textEditingController: controller.searchController),
          ...List.filled(15, const Text("data")),
        ],
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  const TextInputField({super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 36.h,
        width: 343.w,
        // padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(9999.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              SizedBox(
                height: 20.h,
                width: 32.w,
                child: Image.asset(
                  "assets/icons/search_button.png",
                  height: 16.h,
                  width: 16.w,
                ),
              ),
              SizedBox(
                height: 20.h,
                width: 295.w,
                child: TextField(
                  controller: textEditingController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
