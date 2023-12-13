import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../data/models/last_course.dart';
import '../../../widgets/cache_image.dart';
import '../../../widgets/proggress_bar.dart';

class LastCourseItem extends GetWidget<HomeController> {
  LastCourseItem(this.lastCourse, {super.key});

  LastCourse lastCourse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Translator.lastActiveCourse.tr,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: black),
                ),
                TextButton(
                  onPressed: () {
                    controller.gotoTab(1);
                  },
                  child: Text(
                    Translator.myCourses.tr,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: primaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () =>
                controller.gotoCourseInfo(lastCourse.course!.id!.toInt()),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: Container(
                height: lastCourseHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: fourthColor),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.all(5),
                      child: SizedBox(
                        height: lastCourseHeight,
                        width: lastCourseImageWidth,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CacheImage(
                                  url: lastCourse.course!.image ?? ''),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 5, 0, 0),
                              child: Align(
                                alignment: AlignmentDirectional.topStart,
                                child: SvgPicture.asset(
                                    'assets/images/red_dot.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 15, 10, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    lastCourse.course!.header ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: black),
                                  ),
                                ),
                                Text(
                                  '${Translator.session.tr} ${lastCourse.season!.orderPersian ?? ''}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: primaryColor,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${Translator.mentor.tr} : ${lastCourse.course!.mentor!.fullname ?? ''}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: textGray),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ShimmerProgressBar(lastCourse.progress!),
                                SizedBox(width: 15),
                                Container(
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      '${(lastCourse.progress! * 100).toInt()}%',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                            color: black,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
