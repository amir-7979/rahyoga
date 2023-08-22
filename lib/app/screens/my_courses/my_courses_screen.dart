import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/my_courses/widgets/favorit_courses_list.dart';
import 'package:rahyoga/app/screens/my_courses/widgets/purchased_courses_list.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
            Translator.myCourses.tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: black),
          )
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
              child: SizedBox(
                height: 50,
                  child: AppBar(
                    toolbarHeight: 50,
                    titleSpacing: 5,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                         Radius.circular(30),
                      ),
                      side: BorderSide(color: moreTextColor)
                    ),
                    title: TabBar(
                      automaticIndicatorColorAdjustment: true,
                      padding: EdgeInsetsDirectional.zero,
                      indicatorPadding: EdgeInsetsDirectional.zero,
                      tabs: [
                        Tab(
                          height: 40,
                            child: Text(
                              Translator.purchasedCourses.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: primaryColor),
                            )
                        ),
                        Tab(
                            height: 40,
                            child: Text(
                              Translator.generalYogaCourses.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: primaryColor),
                            )
                        ),
                      ],
                      indicator: RectangularIndicator(
                        color: fourthColor,
                        bottomLeftRadius: 30,
                        bottomRightRadius: 30,
                        topLeftRadius: 30,
                        topRightRadius: 30,
                        paintingStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
                child: TabBarView(
                  children: [
                    PurchasedCourseList(),
                    FavoriteCourseList(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

}
