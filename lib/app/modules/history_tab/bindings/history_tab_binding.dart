import 'package:get/get.dart';

import '../controllers/history_tab_controller.dart';

class HistoryTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryTabController>(
      () => HistoryTabController(),
    );
  }
}
