import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_tab_controller.dart';

class SearchTabView extends GetView<SearchTabController> {
  const SearchTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchTabView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
