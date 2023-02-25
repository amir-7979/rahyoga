import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import 'general_course_item.dart';
import 'mini_course_item.dart';

class MiniCourseList extends StatelessWidget {
  const MiniCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Translator.generalYogaCourses.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: black),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                Translator.seeAll.tr,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(
                    color: primaryColor,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        //todo rebuild list
        SizedBox(
          height: generalYogaItemHeight,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                MiniCourseItem(),
                MiniCourseItem(),
                MiniCourseItem(),
                MiniCourseItem(),

              ]),
        ),
      ],
    );

  }
}
