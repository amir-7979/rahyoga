import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'main_controller.dart';

class MainScreen extends GetWidget<MainController> {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        navBarHeight: 60,
        padding: const NavBarPadding.symmetric(horizontal: 5),
        context,
        controller: controller.tabController,
        screens: controller.buildScreens(),
        items: controller.navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: fourthColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        navBarStyle:
            NavBarStyle.style3,
      ),
    );
  }
}
