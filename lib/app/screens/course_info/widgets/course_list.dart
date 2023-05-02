import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/course_info/course_info_controller.dart';
import 'package:rahyoga/app/screens/course_info/widgets/future_item.dart';
import 'package:rahyoga/app/screens/course_info/widgets/passed_item.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../data/models/all.dart';


class CourseList extends StatelessWidget {
  CourseList(this.courses, {Key? key}) : super(key: key);
  List<All> courses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: courses.map((item) {
          return (item.passed == true) ? PassedItem(item) : FutureItem(item);
        }).toList()
      ),
    );
  }
}
