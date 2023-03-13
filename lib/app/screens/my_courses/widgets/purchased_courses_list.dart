import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_controller.dart';
import 'package:rahyoga/app/screens/my_courses/widgets/purchased_course_item.dart';

import '../../../data/models/course.dart';
import '../../../data/models/paid.dart';
import '../../../widgets/shimmer_screen.dart';

class PurchasedCourseList extends GetWidget<MyCoursesController> {
   PurchasedCourseList({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.fetchPaid(),
        builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData) ? purchasedCourses(controller.paid.value!.courses) :  const SimmerScreen());

  }
  Widget purchasedCourses(List<Course>? courses) {
    return courses!.isEmpty ? Container() : Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
      child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (BuildContext ctx, index) => Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 12),
          child: PurchasedCourseItem(courses[index]),
        ),
      ),
    );
  }
}
