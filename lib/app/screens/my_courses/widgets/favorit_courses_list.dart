import 'package:flutter/material.dart';
import 'favorit_courses_item.dart';

class FavoriteCourseList extends StatelessWidget {
  const FavoriteCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FavoriteCourseItem(),
      ],
    );
  }
}
