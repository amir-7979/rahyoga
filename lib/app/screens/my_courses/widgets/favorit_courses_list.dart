import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/theme/colors.dart';
import '../../../data/models/liked_course.dart';
import '../../../widgets/shimmer_screen.dart';
import '../my_courses_controller.dart';
import 'favorit_courses_item.dart';

class FavoriteCourseList extends  GetWidget<MyCoursesController> {
   const FavoriteCourseList({Key? key}) : super(key: key);

   Widget build(BuildContext context) => PagedListView.separated(
     separatorBuilder: (context, item) => const Padding(
       padding: EdgeInsetsDirectional.symmetric(vertical: 3),
       child: Divider(
         color: tertiaryColor2,
       ),
     ),
     padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
     pagingController: controller.pagingController1,
     builderDelegate: PagedChildBuilderDelegate<LikedCourse>(
       firstPageProgressIndicatorBuilder: (_)=>SimmerScreen(),
       noItemsFoundIndicatorBuilder: (_) =>Center(
         child: Text('تمام دوره ها خریداری شده', style: Get.theme
             .textTheme
             .labelMedium!
             .copyWith(
           color: primaryColor,
         ),
         ),
       ),
       newPageProgressIndicatorBuilder: (_)=>Padding(
         padding: const EdgeInsetsDirectional.only(bottom: 10),
         child: Center(
           child: SizedBox(
             height: 20,
             width: 20,
             child: FittedBox(
               fit: BoxFit.fill,
               child: const CircularProgressIndicator(
                 color: primaryColor,
                 strokeWidth: 4,
               ),
             ),
           ),
         ),
       ),
       itemBuilder: (context, item, index) => FavoriteCourseItem(item),
     ),
   );
}
