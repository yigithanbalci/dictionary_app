import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchTabController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      // You can add any logic here that needs to be executed when the text changes
      print("Search query: ${searchController.text}");
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
