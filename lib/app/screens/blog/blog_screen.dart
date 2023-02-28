import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/my_courses/widgets/favorit_courses_list.dart';
import 'package:rahyoga/app/screens/my_courses/widgets/purchased_courses_list.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import 'widgets/blogs_list.dart';
import 'widgets/movement_list.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

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
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      side: BorderSide(color: generalItemBorderGray)
                  ),
                  title: TabBar(
                    automaticIndicatorColorAdjustment: true,
                    padding: EdgeInsetsDirectional.zero,
                    tabs: [
                      Tab(
                          height: 40,
                          child: Text(
                            Translator.yogaMovements.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: primaryColor),
                          )
                      ),
                      Tab(
                          height: 40,
                          child: Text(
                            Translator.articles.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: primaryColor),
                          )
                      ),
                    ],
                    indicator: RectangularIndicator(
                      color: tabBackground,
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
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 7),
                child: TabBarView(
                  children: [
                    MovementList(),
                    BlogList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
