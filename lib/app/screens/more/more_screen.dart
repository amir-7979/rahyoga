import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rahyoga/app/data/models/liked_course.dart';
import 'package:rahyoga/app/screens/more/widgets/course_item.dart';
import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import 'more_controller.dart';

class MoreScreen extends GetView<MoreController> {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: controller.back,
            color: black,
          ),
          title: Text(
            Translator.generalYogaCourses.tr,
            style:
                Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
          ),
        ),
        body: PagedListView.separated(
          separatorBuilder: (context, item) => const Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10),
            child: Divider(),
          ),
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
          pagingController: controller.pagingController,
          builderDelegate: PagedChildBuilderDelegate<LikedCourse>(
            itemBuilder: (context, item, index) => CourseItem(
              item,
            ),
          ),
        ),
      ),
    );
  }
}
