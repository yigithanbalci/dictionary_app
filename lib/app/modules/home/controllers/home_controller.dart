import 'package:get/get.dart';
import 'package:learneng/app/modules/home/views/home_view.dart';

class HomeController extends GetxController {
  final Rx<Tabs> selectedTab = Tabs.home.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleTabSelection(Tabs tab) {
    selectedTab.value = tab;
  }
}
