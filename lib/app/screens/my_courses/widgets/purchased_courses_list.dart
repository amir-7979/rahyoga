import 'package:flutter/material.dart';
import 'package:rahyoga/app/screens/my_courses/widgets/purchased_course_item.dart';

class PurchasedCourseList extends StatelessWidget {
   PurchasedCourseList({Key? key}) : super(key: key);
  var items = [1,1,1,1,1,11,1];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: ListView.separated(
        separatorBuilder: (BuildContext ctx, index) => const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 15),
          child: Divider(height: 1),
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext ctx, index) {
          return  const PurchasedCourseItem();

        },

      ),
    );
  }
}
