import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/theme/colors.dart';
import '../../../data/models/all.dart';
import '../buy_course_controller.dart';

class CourseItem extends StatelessWidget {
  CourseItem(this.course, {Key? key}) : super(key: key);
  final BuyCourseController _ctrl = Get.find<BuyCourseController>();
  All course;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Get.theme.copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            expandedAlignment: Alignment.centerRight,
              iconColor: primaryColor,
              childrenPadding: EdgeInsetsDirectional.zero,
              tilePadding: EdgeInsetsDirectional.only(end: 10),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                        color: fourthColor,
                        borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(12))),
                    child: Center(
                      child: Text(
                        course.order.toString(),
                        style: Get.theme.textTheme.headlineMedium!
                            .copyWith(color: primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth-230,
                          child: Text(
                            course.header ?? '',
                            style: Get.theme.textTheme.headlineMedium!
                                .copyWith(color: primaryColor),
                          ),
                        ),
                        Text(
                          course.durationPersian ?? '',
                          style: Get.theme.textTheme.headlineSmall!
                              .copyWith(color: grayText2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 47),
                  child: Text(
                    course.description ?? '',
                    maxLines: 4,
                    style: Get.theme.textTheme.headlineSmall!
                        .copyWith(color: grayText2),
                  ),
                ),
                const SizedBox(height: 5),
              ]),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 47),
          child: Divider(height: 1),
        ),
      ],
    );
  }
}
