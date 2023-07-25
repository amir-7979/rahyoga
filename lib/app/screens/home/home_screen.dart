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
    print('here');
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
                      () => (controller.home.value!.courseCartCounter != null && controller.home.value!.courseCartCounter! > 0)
                          ? Positioned(
                              right: 5,
                              bottom: 8,
                              child: Container(
                                padding: EdgeInsets.all(2.5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  controller.home.value!.courseCartCounter.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          : Container(height: 5,),
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
          if (home.lastCourse != null && screenWidth < 450) LastCourseItem(home.lastCourse!) else LastCourseItem2(home.lastCourse!),
          if (home.lastCourse != null) const SizedBox(height: 25),
          if (home.courses != null && home.courses!.isNotEmpty)
            CourseList(Translator.generalYogaCourses.tr, home.courses!,
                controller.gotoMoreScreen),
          if (home.courses != null && home.courses!.isNotEmpty)
            const SizedBox(height: 25),
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
