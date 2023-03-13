import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_screen.dart';
import 'package:rahyoga/app/screens/profile/profile_screen.dart';
import 'package:rahyoga/core/theme/colors.dart';
import '../../../core/languages/translator.dart';
import '../blog/blog_screen.dart';
import '../home/home_screen.dart';
import 'main_controller.dart';

class MainScreen extends StatelessWidget {


  final MainController ctrl = Get.find<MainController>();

  MainScreen({super.key});

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const MyCoursesScreen(),
      const BlogScreen(),
      const ProfileScreen(),
    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Transform.scale(
            scale: 1.5,
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(primaryColor, BlendMode.modulate),
              child: SvgPicture.asset('assets/images/home.svg',),
            ),),
        title: Translator.home.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,

      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/my_courses.svg'),),
        title: Translator.myCourses.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,

      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/blog.svg'),),
        title: Translator.blog.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,

        //activeColorPrimary: primaryColor,
        //inactiveColorPrimary: textGray,
      ),

      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/profile.svg'),),
        title: Translator.profile.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
          navBarHeight: 60,
          padding: const NavBarPadding.symmetric(horizontal: 5),
          context,
          controller: ctrl.tabController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: bottomBarGray, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
        ),

    );
  }
}