import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../data/models/course.dart';
import '../home_controller.dart';
import 'paid_item.dart';

class PaidList extends StatelessWidget {
  PaidList(this.title, this.courses, {super.key});

  final String title;
  final List<Course> courses;
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: black),
              ),
              TextButton(
                onPressed: () => controller.gotoTab(1),
                child: Text(
                  Translator.seeAll.tr,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: primaryColor,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
        //todo rebuild list
        SizedBox(
          height: generalYogaItemHeight,
          child: coursesList(courses),
        ),
      ],
    );
  }

  Widget coursesList(List<Course>? courses) {
    return courses == null || courses.isEmpty
        ? Container()
        : Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (BuildContext ctx, index) {
                return PaidItem(courses[index]);
              },
            ),
          );
  }
}
