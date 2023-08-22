import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../core/theme/colors.dart';
import '../../data/models/paid_course_info.dart';
import '../../widgets/shimmer_screen.dart';
import 'course_info_controller.dart';
import 'widgets/bottom_app_bar_nav.dart';
import 'widgets/course_list.dart';

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
          init: controller,
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
              FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: Get.width,
                  height: Get.width * 9 / 16,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: FlickVideoPlayer(
                        flickManager: controller.flickManager,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
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
                                controller.course.value!.progress!.seasons.all!
                                            .isNotEmpty &&
                                        controller
                                            .course
                                            .value!
                                            .progress!
                                            .seasons
                                            .all![controller.index.value]
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
                        ),
                        SizedBox(width: 7),
                        Obx(
                          () => (controller.isExist.value)
                              ? SizedBox(
                                  height: 32,
                                  width: 106,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: fourthColor,
                                        minimumSize: const Size.fromWidth(100),
                                        elevation: 0,
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () async {
                                        controller.download();
                                      },
                                      child: SvgPicture.asset(
                                        'assets/images/basket/delete.svg',
                                        height: 21,
                                        width: 25,
                                        color: primaryColor,
                                      ),),)
                              : SizedBox(
                                  height: 32,
                                  width: 106,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: fourthColor,
                                      minimumSize: const Size.fromWidth(100),
                                      elevation: 0,
                                      shape: const StadiumBorder(),
                                    ),
                                    onPressed: () async {
                                      controller.download();
                                    },
                                    child: (controller.pressDownloading.value)
                                        ? SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: CircularProgressIndicator(
                                              color: primaryColor,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              controller.isDownloading.value
                                                  ? SvgPicture.asset(
                                                      'assets/images/course_info/pause-button.svg',
                                                      height: 21,
                                                      width: 25,
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/images/course_info/download.svg',
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                              if (controller
                                                  .isDownloading.value)
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                          10, 0, 0, 0),
                                                  child: Text(
                                                    "${controller.downloadProgress.value.toStringAsFixed(0)}%",
                                                    style: Get.theme.textTheme
                                                        .labelMedium!
                                                        .copyWith(
                                                            color:
                                                                primaryColor),
                                                  ),
                                                ),
                                            ],
                                          ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    if (controller
                        .course.value!.progress!.seasons.all!.isNotEmpty)
                      Text(
                        '${controller.course.value!.progress!.seasons.all![controller.index.value].header ?? ''}',
                        style: Get.theme.textTheme.bodySmall!
                            .copyWith(color: black),
                      ),
                    SizedBox(height: 12),
                    if (controller
                        .course.value!.progress!.seasons.all!.isNotEmpty)
                      ReadMoreText(
                        controller.course.value!.progress!.seasons
                                .all![controller.index.value].description ??
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
