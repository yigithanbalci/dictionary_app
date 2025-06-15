import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/history_tab_controller.dart';

class HistoryTabView extends GetView<HistoryTabController> {
  const HistoryTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 658.h,
      width: 375.w,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: controller.historyList.length,
        itemBuilder: (BuildContext context, int index) => HistoryElement(
          data: controller.historyList.elementAt(index),
          index: index,
          onTap: controller.handleHistorySelection,
        ),
      ),
    );
  }
}

class HistoryElement extends StatelessWidget {
  const HistoryElement({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
  });

  final HistoryEntity data;
  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: SizedBox(
        height: 48.h,
        width: 375.w,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            data.data,
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFFA6A6A6),
              fontFamily: 'UberMove',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryEntity {
  const HistoryEntity({required this.data, required this.id});
  final String data;
  final int id;
}
