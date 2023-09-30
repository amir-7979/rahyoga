import 'package:flutter/material.dart';
import 'future_item.dart';
import 'passed_item.dart';
import '../../../data/models/all.dart';


class CourseList extends StatelessWidget {
  CourseList(this.courses);
  final List<All> courses;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: courses.map((item) {
        return (item.passed == true) ? PassedItem(item) : FutureItem(item);
      }).toList()
    );
  }
}
