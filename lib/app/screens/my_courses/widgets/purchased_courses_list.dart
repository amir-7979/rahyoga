import 'package:flutter/material.dart';
import 'package:rahyoga/app/screens/my_courses/widgets/purchased_course_item.dart';

class PurchasedCourseList extends StatelessWidget {
  const PurchasedCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
      PurchasedCourseItem(),
    ],
    );
  }
}
