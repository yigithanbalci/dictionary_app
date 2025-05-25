import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorites_tab_controller.dart';

class FavoritesTabView extends GetView<FavoritesTabController> {
  const FavoritesTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavoritesTabView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavoritesTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
