import 'package:get/get.dart';
import 'package:learneng/app/modules/favorites_tab/views/favorites_tab_view.dart';

class FavoritesTabController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      FavoritesBottomSheet().then((value) {
        if (value != null) {
          Get.snackbar("Selection", value);
        }
      });
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
}
