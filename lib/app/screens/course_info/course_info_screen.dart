import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../core/theme/colors.dart';
import '../../data/models/paid_course_info.dart';
import '../../widgets/shimmer_screen.dart';
import 'widgets/course_list.dart';
import 'course_info_controller.dart';
import 'widgets/bottom_app_bar_nav.dart';

class CourseInfoScreen extends GetView<CourseInfoController> {
  CourseInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: controller.back,
            color: black,
          ),
          title: Obx(
            () => Text(
              controller.course.value!.header != null
                  ? controller.course.value!.header ?? ''
                  : '',
              style: Get.theme.textTheme.headlineLarge!.copyWith(color: black),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBarNav(),
        body: GetBuilder<CourseInfoController>(
          init: CourseInfoController(),
          builder: (context) =>
              context.isLoading.value || controller.course.value!.id == null
                  ? const SimmerScreen()
                  : favoriteCourses(controller.course.value),
        ),
      ),
    );
  }

  Widget favoriteCourses(PaidCourseInfo? course) {
    return course == null
        ? Container()
        : ListView(
            children: [
              /*SizedBox(
                    height: 200,
                    width: screenWidth,
                    child: Chewie(controller: controller.chewieController!)),*/

              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 32,
                          width: 115,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 6, 12, 4),
                              minimumSize: const Size.fromWidth(107),
                              backgroundColor: fourthColor,
                              elevation: 0,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () async {
                              controller.updateSession();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                controller
                                        .course
                                        .value!
                                        .progress!
                                        .seasons
                                        .all![controller.index.value - 1]
                                        .passed!
                                    ? SvgPicture.asset(
                                        'assets/images/course_info/green_check.svg',
                                        height: 23,
                                        width: 23)
                                    : SvgPicture.asset(
                                        'assets/images/course_info/play2.svg',
                                        height: 23,
                                        width: 23,
                                      ),
                                const SizedBox(width: 5),
                                Text(
                                  controller.fullScreen,
                                  style: Get.theme.textTheme.headlineMedium!
                                      .copyWith(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      '${controller.course.value!.progress!.seasons.all![controller.index.value - 1].header ?? ''}',
                      style:
                          Get.theme.textTheme.bodySmall!.copyWith(color: black),
                    ),
                    SizedBox(height: 12),
                    ReadMoreText(
                      controller.course.value!.progress!.seasons
                              .all![controller.index.value - 1].description ??
                          '',
                      trimLines: 4,
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: profileGray, height: 1.3),
                      moreStyle: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: moreTextColor),
                      lessStyle: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: moreTextColor),
                      colorClickableText: profileGray,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: controller.more,
                      trimExpandedText: controller.less,
                    ),
                    SizedBox(height: 45),
                    if (controller.course.value!.progress!.seasons.all != null)
                      Text(
                        controller.courseSession,
                        style: Get.theme.textTheme.bodySmall!
                            .copyWith(color: black),
                      ),
                    if (controller.course.value!.progress!.seasons.all != null)
                      SizedBox(height: 30),
                    if (controller.course.value!.progress!.seasons.all != null)
                      CourseList(
                          controller.course.value!.progress!.seasons.all!),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          );
  }
}
