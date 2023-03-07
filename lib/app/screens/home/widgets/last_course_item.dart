import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../data/models/last_course.dart';
import '../../../widgets/cache_image.dart';

class LastCourseItem extends StatelessWidget {
  const LastCourseItem(this._itemModel, {super.key});
  final LastCourse _itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 5),
      child: Column(
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
                onPressed: () {
                  //todo go to see_all screen
                },
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
      ),
    );
  }
}
