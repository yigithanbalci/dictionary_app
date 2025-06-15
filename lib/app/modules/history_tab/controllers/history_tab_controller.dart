import 'package:get/get.dart';
import 'package:learneng/app/modules/history_tab/views/history_tab_view.dart';

class HistoryTabController extends GetxController {
  final RxList<HistoryEntity> historyList = <HistoryEntity>[].obs;
  final int batchSize = 15;
  int currentPage = 0;
  @override
  void onInit() {
    super.onInit();
    historyList.value = List<HistoryEntity>.generate(
      15,
      (int index) =>
          HistoryEntity(data: 'History Item ${index + 1}', id: index),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleHistorySelection(int index) {
    final HistoryEntity entity = historyList.elementAt(index);
    print('Selected history: ${entity.data}');
    // Add your logic to handle the selection of a history item
  }
}
