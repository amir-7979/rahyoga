import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../data/models/last_course.dart';
import '../../../widgets/cache_image.dart';

class LastCourseItem extends StatelessWidget {
   LastCourseItem(this.lastCourse, {super.key});
  final LastCourse lastCourse;
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 5),
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
                        color: primaryColor, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              controller.gotoCourseInfo(lastCourse.course!.id!.toInt()??1);
               },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: SizedBox(
                height: lastCourseHeight,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: bottomBarGray),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: SizedBox(
                          height: lastCourseHeight,
                          width: lastCourseImageWidth,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CacheImage(
                                url: lastCourse.course!.image??''
                            ),                        ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(5, 5, 15, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    lastCourse.course!.header??'',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: black),
                                  ),
                                  Text(
                                    '${Translator.session.tr} ${lastCourse.season!.orderPersian??''}',
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
                                    '${Translator.mentor.tr} : ${lastCourse.course!.mentor!.fullname??''}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: textGray),
                                  ),
                                  Container(
                                    child: CircularPercentIndicator(
                                      radius:30,
                                      lineWidth: 4.0,
                                      percent: lastCourse.progress??0.0,
                                      center: Text(
                                        '${lastCourse.progress.toString().substring(2)}%',
                                        style: Get.theme
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(color: primaryColor),
                                      ),
                                      circularStrokeCap: CircularStrokeCap.round,
                                      progressColor: primaryColor,
                                    ),
                                  ),
                                  /*Padding(
                                    padding: const EdgeInsetsDirectional.only(end: 10),
                                    child: LinearPercentIndicator(
                                      padding: EdgeInsets.zero,
                                      isRTL: true,
                                      width: screenWidth - 220,
                                      animation: true,
                                      lineHeight: 10.0,
                                      animationDuration: 1000,
                                      percent: lastCourse.progress??0.0,
                                      barRadius: Radius.circular(10),
                                      backgroundColor: progressBackgroundColor,
                                      //progressColor: primaryColor,
                                      //clipLinearGradient: true,
                                      linearGradient: LinearGradient(colors: [primaryColor, tertiaryColor, ]),

                                    ),
                                  ),
                                  Text('${(lastCourse.progress).toString().substring(2)}%', style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                    color: black,
                                  ),)
*/
                                ],
                              ),
                              //todo pogress barRow(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
