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
        spacing: 16.h,
        children: [
          4.verticalSpace,
          TextInputField(
            textEditingController: controller.searchController,
            onSubmitted: controller.handleWordSelection,
          ),
          Obx(
            () => Expanded(
              child: controller.wordList.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.wordList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          SearchElement(
                            data: controller.wordList.elementAt(index),
                            index: index,
                            onTap: controller.handleWordSelectionByIndex,
                          ),
                    )
                  : controller.resultList.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.resultList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ResultElement(
                            data: controller.resultList.elementAt(index),
                            index: index,
                            onTap: controller.handleWordSelection,
                          ),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultElement extends StatelessWidget {
  const ResultElement({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
  });

  final Word data;
  final int index;
  final void Function(String word) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(data.data),
      child: Container(
        height: 48.w,
        width: 375.h,
        color: const Color(0xFFE8E8E8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Text(
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF000000),
              fontFamily: 'UberMove',
              fontWeight: FontWeight.w400,
            ),
            "${data.typeString} ${data.data}",
          ),
        ),
      ),
    );
  }
}

class SearchElement extends StatelessWidget {
  const SearchElement({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
  });

  final String data;
  final int index;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: 48.w,
        width: 375.h,
        color: const Color(0xFFE8E8E8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Text(
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF000000),
              fontFamily: 'UberMove',
              fontWeight: FontWeight.w400,
            ),
            data,
          ),
        ),
      ),
    );
  }
}

class Word {
  const Word({required this.data, required this.type});
  final String data;
  final WordType type;

  String get typeString {
    switch (type) {
      case WordType.noun:
        return "n.";
      case WordType.verb:
        return "v.";
      case WordType.adjective:
        return "adj.";
      case WordType.adverb:
        return "adv.";
      // case WordType.preposition:
      //   return "preposition";
      // case WordType.conjunction:
      //   return "conjunction";
      // case WordType.interjection:
      //   return "interjection";
    }
  }
}

enum WordType {
  noun,
  verb,
  adjective,
  adverb,
  // preposition,
  // conjunction,
  // interjection,
}

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.textEditingController,
    required this.onSubmitted,
  });
  final TextEditingController textEditingController;
  final void Function(String) onSubmitted;

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
                  onSubmitted: onSubmitted,
                  keyboardType: TextInputType.text,
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
