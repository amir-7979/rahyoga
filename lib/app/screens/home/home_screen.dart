import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../data/models/home.dart';
import '../../widgets/shimmer_screen.dart';
import 'home_controller.dart';
import 'widgets/course_list.dart';
import 'widgets/last_course_item.dart';
import 'widgets/movements_slider.dart';
import 'widgets/paid_list.dart';

class HomeScreen extends GetWidget<HomeController> {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          Translator.app_name.tr,
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
        ),
        actions: [
          /*IconButton(
            onPressed: () {
            },
            icon: SvgPicture.asset('assets/images/search.svg'),
          ),*/
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: IconButton(
              onPressed: () {
                controller.gotoBasketScreen();
              },
              icon: SvgPicture.asset('assets/images/basket.svg'),
            ),
          ),
        ],
      ),
      body:GetX<HomeController>(
          init: HomeController(),
          builder: (snapshot) => !snapshot.initialized ? SimmerScreen(): home(controller.home.value!)
      ),
      /*FutureBuilder(
          future: controller.fetchHome(),
          builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData) ? home(controller.home.value) :  const SimmerScreen()),*/
    );
  }

  Widget home(Home? home){
    return  home == null ? Container() : Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 0, 0),
      child: ListView(
        cacheExtent: 700,
        children: [
          if (home.lastCourse != null) LastCourseItem(home.lastCourse!),
          const SizedBox(height: 25),
          if (home.courses!.isNotEmpty) CourseList(Translator.generalYogaCourses.tr, home.courses!, controller.gotoMoreScreen),
          const SizedBox(height: 25),
          if (home.miniCourses!.isNotEmpty) PaidList(Translator.purchasedCourses.tr, home.paid!, (){},),
          const SizedBox(height: 25),
          if (home.movements!.isNotEmpty) MovementsSlider(home.movements!),
          const SizedBox(height: 15),
          if (home.miniCourses!.isNotEmpty) CourseList(Translator.miniYogaCourses.tr, home.miniCourses!, controller.gotoMoreScreen),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
