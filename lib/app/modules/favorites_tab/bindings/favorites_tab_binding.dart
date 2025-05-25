import 'package:get/get.dart';

import '../controllers/favorites_tab_controller.dart';

class FavoritesTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesTabController>(
      () => FavoritesTabController(),
    );
  }
}
