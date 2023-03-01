import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../buy_course_controller.dart';
import 'course_item.dart';

class CourseList extends StatelessWidget {
  CourseList({Key? key}) : super(key: key);
  final BuyCourseController _ctrl = Get.find<BuyCourseController>();

  var items = [1,1,1,1,1,1,1];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(int i in items)
          CourseItem()
      ],
    );
  }
}
