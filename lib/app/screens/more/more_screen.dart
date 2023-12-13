import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rahyoga/app/data/models/liked_course.dart';
import 'package:rahyoga/app/screens/more/widgets/course_item.dart';

import '../../../core/theme/colors.dart';
import '../../widgets/shimmer_screen.dart';
import 'more_controller.dart';

class MoreScreen extends GetView<MoreController> {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0.5,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black,
          leading: BackButton(
            onPressed: controller.back,
            color: black,
          ),
          title: Obx(
            ()=> Text(
              controller.title.value,
              style:
                  Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
            ),
          ),
        ),
        body:PagedListView.separated(
          separatorBuilder: (context, item) => const Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10),
            child: Divider(
              color: tertiaryColor2,
            ),
          ),
          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 10, 15),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<LikedCourse>(
            firstPageProgressIndicatorBuilder: (_)=>SimmerScreen(),
            noItemsFoundIndicatorBuilder: (_) =>Center(
              child: Text('تمام دوره ها خریداری شده',
                style: Get.theme
                  .textTheme
                  .labelMedium!
                  .copyWith(
                color: primaryColor,
              ),
              ),
            ),
            newPageErrorIndicatorBuilder: (_)=>Container(),
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
            itemBuilder: (context, item, index) => CourseItem(item),
          ),
        )

      ),
    );
  }

}
