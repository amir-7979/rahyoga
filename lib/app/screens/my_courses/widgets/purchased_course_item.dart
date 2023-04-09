import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_controller.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/models/course.dart';
import '../../../widgets/cache_image.dart';

class PurchasedCourseItem extends StatelessWidget {

   PurchasedCourseItem(this.course, {super.key});
  final Course course;
  MyCoursesController controller = Get.find<MyCoursesController>();


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoCourseInfo(course.id??1);
      },
      child: SizedBox(
        height: purchasedItemHeight,
        width: screenWidth,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 10, 5),
              child: SizedBox(
                height: purchasedItemHeight,
                width: purchasedItemImageWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CacheImage(
                      url:course.image??''),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 8, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: screenWidth - 240,
                              child: Text(
                                course.header??'',
                                style: Get.theme
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: black),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '${Translator.mentor.tr} : ${course.mentor!.fullname??''}',
                              style: Get.theme
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: grayText2),
                            ),
                          ],
                        ),
                        Container(
                          child: CircularPercentIndicator(
                            radius:30,
                            lineWidth: 4.0,
                            percent: course.progress??0.0,
                            center: Text(
                              '${course.progress.toString().substring(2)}%',
                              style: Get.theme
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: primaryColor),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${Translator.session.tr} ${course.theNumberOfSeasonsPersian}',
                            style: Get.theme
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: textGray,
                                ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${Translator.continueCourse.tr}',
                                style: Get.theme
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: primaryColor,
                                    ),
                              ),
                                Icon(
                                    Icons.arrow_forward_outlined,
                                    color: primaryColor,
                                  )
                            ],
                          )
                        ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
