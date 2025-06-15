import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learneng/app/modules/search_tab/views/search_tab_view.dart';

class SearchTabController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  final RxList<String> wordList = <String>[].obs;
  final RxList<Word> resultList = <Word>[].obs;
  final Rx<SearchState> searchState = SearchState.init.obs;
  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      // You can add any logic here that needs to be executed when the text changes
      if (searchController.text.length >= 3) {
        // For example, you can filter the wordList based on the search input
        searchState.value = SearchState.searching;
        wordList.value = List<String>.generate(
          15,
          (int index) =>
              searchController.text + String.fromCharCode(index + 97),
        );
      } else {
        searchState.value = SearchState.init;
      }
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

  void handleWordSelectionByIndex(int index) {
    handleWordSelection(wordList.elementAt(index));
  }

  void handleWordSelection(String toSearch) {
    searchState.value = SearchState.result;
    final String word = toSearch.trim().toLowerCase();
    print('Selected word: $word');
    resultList.value = [
      Word(data: word, type: WordType.adverb),
      Word(data: word, type: WordType.verb),
      Word(data: word, type: WordType.adjective),
      Word(data: word, type: WordType.noun),
    ];
  }
}
