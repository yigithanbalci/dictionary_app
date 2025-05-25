import 'package:get/get.dart';

import '../controllers/settings_tab_controller.dart';

class SettingsTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsTabController>(
      () => SettingsTabController(),
    );
  }
}
