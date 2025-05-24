import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Obx(
          () => Column(
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
                child: controller.selectedTab.value.widget,
              ),
              TabBar(
                selectedTab: controller.selectedTab.value,
                callBack: controller.handleTabSelection,
              ),
              Container(color: const Color(0x88E8E8E8), height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({super.key, required this.selectedTab, required this.callBack});
  final void Function(Tabs) callBack;
  final Tabs selectedTab;

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
        children: Tabs.values
            .map(
              (Tabs tab) =>
                  Tab(tab: tab, selectedTab: selectedTab, callBack: callBack),
            )
            .toList(),
      ),
    );
  }
}

class Tab extends StatelessWidget {
  const Tab({
    super.key,
    required this.selectedTab,
    required this.tab,
    required this.callBack,
  });

  final Tabs tab;
  final Tabs selectedTab;
  final void Function(Tabs p1) callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack(tab);
      },
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
              color: tab == selectedTab
                  ? const Color(0xFF000000)
                  : const Color(0xFF5E5E5E),
            ),
            SizedBox(
              height: 16.h,
              child: Text(
                tab.title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: tab == selectedTab
                      ? const Color(0xFF000000)
                      : const Color(0xFF5E5E5E),
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
        return const Icon(Icons.home);
      case Tabs.history:
        return const Icon(Icons.history);
      case Tabs.favorites:
        return const Icon(Icons.favorite);
      case Tabs.settings:
        return const Icon(Icons.settings);
    }
  }

  @override
  int compareTo(Tabs other) {
    return title.compareTo(other.title);
  }
}
