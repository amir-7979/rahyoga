import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';

class LastCourseItem extends StatelessWidget {
  const LastCourseItem({super.key});

  //final LastCourseModel _itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Translator.lastActiveCourse.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: black),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                Translator.myCourses.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: primaryColor, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: lastCourseHeight,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: bottomBarGray),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: SizedBox(
                      height: lastCourseHeight,
                      width: lastCourseImageWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CacheImage(
                            url:
                                'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5, 5, 15, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'course name',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: black),
                              ),
                              Text(
                                '${Translator.session.tr}${1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: primaryColor,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            '${Translator.lastSeen.tr} : ${DateTime.now().day}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: textGray),
                          ),
                          //todo pogress barRow(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
