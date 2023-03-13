import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/liked_courses.dart';
import '../../../widgets/shimmer_screen.dart';
import '../my_courses_controller.dart';
import 'favorit_courses_item.dart';

class FavoriteCourseList extends  GetWidget<MyCoursesController> {
   const FavoriteCourseList({Key? key}) : super(key: key);

   Widget build(BuildContext context) {
     return FutureBuilder(
         future: controller.fetchliked(),
         builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData) ? favoriteCourses(controller.liked.value) :  const SimmerScreen());

   }
   Widget favoriteCourses(LikedCourses? courses) {
     return courses!.likedCourses!.isEmpty ? Container() : Padding(
       padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
       child: ListView.builder(
         itemCount: courses.likedCourses!.length,
         itemBuilder: (BuildContext ctx, index) => Padding(
           padding: const EdgeInsetsDirectional.only(bottom: 12),
           child: FavoriteCourseItem(courses.likedCourses![index]),
         ),
       ),
     );
   }


}
