import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/home/widgets/last_course_item2.dart';

import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/consts.dart';
import '../../data/models/home.dart';
import '../../widgets/shimmer_screen.dart';
import 'home_controller.dart';
import 'widgets/course_list.dart';
import 'widgets/last_course_item.dart';
import 'widgets/movements_slider.dart';
import 'widgets/paid_list.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.5,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black,
        backgroundColor: white,
        scrolledUnderElevation: 0.5,
        title: Text(
          Translator.app_name.tr,
          style: Get.textTheme.headlineLarge!.copyWith(color: black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: Container(
              width: 45,
              height: 45,
              child: Center(
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.gotoBasketScreen();
                      },
                      icon: SvgPicture.asset('assets/images/basket.svg'),
                    ),
                    Obx(
                      () => (controller.home.value!.courseCartCounter != null &&
                              controller.home.value!.courseCartCounter! > 0)
                          ? Positioned(
                              right: 4,
                              bottom: 3,
                              child: Container(
                                padding: EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  controller.home.value!.courseCartCounter
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 5,
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
          key: Key('home'),
          init: controller,
          builder: (context) => context.home.value!.courses == null
              ? const SimmerScreen()
              : home(controller.home.value!)),
    );
  }

  Widget home(Home home) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
      child: ListView(
        cacheExtent: 700,
        children: [
          if (home.lastCourse != null)
            (screenWidth < 450)
                ? LastCourseItem(home.lastCourse!)
                : LastCourseItem2(home.lastCourse!),
          if (home.lastCourse != null) const SizedBox(height: 25),
          if (home.courses != null)
            (home.courses!.isNotEmpty)
                ? CourseList(Translator.generalYogaCourses.tr, home.courses!,
                    controller.gotoMoreScreen)
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Translator.generalYogaCourses.tr,
                              style: Get.theme.textTheme.displayLarge!
                                  .copyWith(color: black),
                            ),
                            TextButton(
                              onPressed: () => controller.gotoMoreScreen(),
                              child: Text(
                                Translator.seeAll.tr,
                                style: Get.theme.textTheme.displayMedium!
                                    .copyWith(
                                        color: primaryColor,
                                        decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'تمام دوره ها خریداری شده',
                            style: Get.theme.textTheme.displayMedium!
                                .copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
          if (home.courses != null) const SizedBox(height: 25),
          if (home.paid != null && home.paid!.isNotEmpty)
            PaidList(Translator.purchasedCourses.tr, home.paid!),
          if (home.paid != null && home.paid!.isNotEmpty)
            const SizedBox(height: 25),
          if (home.movements != null && home.movements!.isNotEmpty)
            MovementsSlider(home.movements!),
          if (home.movements != null && home.movements!.isNotEmpty)
            const SizedBox(height: 15),
          if (home.miniCourses != null && home.miniCourses!.isNotEmpty)
            CourseList(Translator.miniYogaCourses.tr, home.miniCourses!,
                controller.gotoMiniMoreScreen),
          if (home.miniCourses != null && home.miniCourses!.isNotEmpty)
            const SizedBox(height: 5),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
