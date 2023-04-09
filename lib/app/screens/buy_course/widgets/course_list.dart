import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../data/models/all.dart';
import '../buy_course_controller.dart';
import 'course_item.dart';

class CourseList extends GetView<BuyCourseController> {
  CourseList(this.courses, {Key? key}) : super(key: key);
  List<All> courses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: courses.map((item) {
          return CourseItem(item);
        }).toList()
      ),
    );

  }
}
