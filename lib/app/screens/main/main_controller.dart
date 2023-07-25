import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';
import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../blog/blog_screen.dart';
import '../home/home_screen.dart';
import '../my_courses/my_courses_screen.dart';
import '../profile/profile_screen.dart';

class MainController extends GetxController{
  final PersistentTabController tabController = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
       HomeScreen(),
       MyCoursesScreen(),
       BlogScreen(),
       ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset(
            'assets/images/main/home2.svg',
          ),
        ),
        inactiveIcon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset(
            'assets/images/main/home.svg',
          ),
        ),
        title: Translator.home.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,
        activeColorSecondary: primaryColor,
       ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/main/my_course2.svg'),
        ),
        inactiveIcon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/main/my_course.svg'),
        ),
        title: Translator.myCourses.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/main/blog2.svg'),
        ),
        inactiveIcon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/main/blog.svg'),
        ),
        title: Translator.blog.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/main/profile2.svg'),
        ),
        inactiveIcon: Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset('assets/images/main/profile.svg'),
        ),
        title: Translator.profile.tr,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textGray,
        contentPadding: 5,
      ),
    ];
  }

  void setTab(int i){
    //tabController.jumpToTab(i);
    tabController.index = i;
    if(i == 0){
      Get.find<HomeController>().refresh();
    }
    update();
    refresh();
  }

  void update2(){
    update();
  }

}
