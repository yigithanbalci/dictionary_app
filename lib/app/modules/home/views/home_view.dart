import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:learneng/app/modules/favorites_tab/controllers/favorites_tab_controller.dart';
import 'package:learneng/app/modules/favorites_tab/views/favorites_tab_view.dart';
import 'package:learneng/app/modules/history_tab/controllers/history_tab_controller.dart';
import 'package:learneng/app/modules/history_tab/views/history_tab_view.dart';
import 'package:learneng/app/modules/search_tab/controllers/search_tab_controller.dart';
import 'package:learneng/app/modules/search_tab/views/search_tab_view.dart';
import 'package:learneng/app/modules/settings_tab/views/settings_tab_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final List<Tabs> tabList = Tabs.values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Container(color: const Color(0xFFA964F7), height: 48.h),
                Container(
                  color: const Color(0xFFA964F7),
                  height: 32.h,
                  width: 375.w,
                  child: Center(
                    child: Text(
                      'LearnEng',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xFFFFFFFF),
                        fontFamily: 'UberMove',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFFFFFFFF),
                  height: 658.h,
                  width: 375.w,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: tabList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // controller.selectedTab.value.widget
                      return tabList[index].widget;
                    },
                  ),
                ),
                TabBar(
                  tabIndex: controller.tabIndex.value,
                  callBack: controller.handleTabSelection,
                  tabList: tabList,
                ),
                Container(color: const Color(0x88E8E8E8), height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({
    super.key,
    required this.tabIndex,
    required this.callBack,
    required this.tabList,
  });
  final void Function(int) callBack;
  final double tabIndex;
  final List<Tabs> tabList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0x88E8E8E8),
        border: Border(top: BorderSide(color: Color(0x88000000))),
      ),
      height: 62.h,
      width: 375.w,
      child: Row(
        children: tabList
            .asMap()
            .entries
            .map(
              (MapEntry<int, Tabs> tabEntry) => Tab(
                tab: tabEntry.value,
                colorFactor: pow(tabIndex - tabEntry.key, 2) > 1
                    ? 1
                    : pow(tabIndex - tabEntry.key, 2).toDouble(),
                callBack: () => callBack(tabEntry.key),
              ),
            )
            .toList(),
      ),
    );
  }
}

class Tab extends StatelessWidget {
  const Tab({
    super.key,
    required this.colorFactor,
    required this.tab,
    required this.callBack,
  });

  final Tabs tab;
  final double colorFactor;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: 62.h,
        width: 93.75.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              tab.iconPath,
              height: 18.h,
              width: 20.w,
              color: Color.lerp(
                const Color(0xFF000000),
                const Color(0xFF5E5E5E),
                colorFactor,
              ),
            ),
            SizedBox(
              height: 16.h,
              child: Text(
                tab.title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color.lerp(
                    const Color(0xFF000000),
                    const Color(0xFF5E5E5E),
                    colorFactor,
                  ),
                  fontFamily: 'UberMove',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Tabs implements Comparable<Tabs> {
  home(title: 'Home', iconPath: 'assets/icons/home.png'),
  history(title: 'History', iconPath: 'assets/icons/history.png'),
  favorites(title: 'Favorites', iconPath: 'assets/icons/favorites.png'),
  settings(title: 'Settings', iconPath: 'assets/icons/settings.png');

  const Tabs({required this.title, required this.iconPath});
  final String title;
  final String iconPath;

  Widget get widget {
    switch (this) {
      case Tabs.home:
        Get.put(SearchTabController());
        return const SearchTabView();
      case Tabs.history:
        Get.put(HistoryTabController());
        return const HistoryTabView();
      case Tabs.favorites:
        Get.put(FavoritesTabController());
        return const FavoritesTabView();
      case Tabs.settings:
        return const SettingsTabView();
    }
  }

  @override
  int compareTo(Tabs other) {
    return title.compareTo(other.title);
  }
}
