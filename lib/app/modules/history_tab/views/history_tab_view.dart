import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_tab_controller.dart';

class HistoryTabView extends GetView<HistoryTabController> {
  const HistoryTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryTabView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HistoryTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
