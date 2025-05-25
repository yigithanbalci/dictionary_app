import 'package:get/get.dart';

import '../controllers/search_tab_controller.dart';

class SearchTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchTabController>(
      () => SearchTabController(),
    );
  }
}
