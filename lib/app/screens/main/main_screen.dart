import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'main_controller.dart';

class MainScreen extends StatelessWidget {
  final MainController controller = Get.find<MainController>();

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
        backgroundColor: bottomBarGray,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
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
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }
}
