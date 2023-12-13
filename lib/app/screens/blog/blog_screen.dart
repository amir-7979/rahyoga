import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import 'widgets/blogs_list.dart';
import 'widgets/movement_list.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: white,
          appBar: AppBar(
              elevation: 0.5,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.black,
              title: Text(
                Translator.myCourses.tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: black),
              )),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                child: SizedBox(
                  height: 50,
                  child: AppBar(
                    elevation: 0,
                    toolbarHeight: 50,
                    titleSpacing: 5,
                    surfaceTintColor: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        side: BorderSide(color: moreTextColor)),
                    title: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.zero,
                      indicator: RectangularIndicator(
                        color: fourthColor,
                        horizontalPadding: 0,
                        // Adjust this padding as needed
                        verticalPadding: 6,
                        bottomLeftRadius: 30,
                        bottomRightRadius: 30,
                        topLeftRadius: 30,
                        topRightRadius: 30,
                      ),
                      splashBorderRadius: BorderRadius.zero,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: MaterialStateProperty.resolveWith(
                        (Set states) {
                          return states.contains(MaterialState.focused)
                              ? null
                              : Colors.transparent;
                        },
                      ),
                      tabs: [
                        Tab(
                            height: 50,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                'آسانا',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: primaryColor),
                              ),
                            )),
                        Tab(
                            height: 50,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              child: Text(
                                Translator.articles.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: primaryColor),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 7),
                  child: TabBarView(
                    children: [
                      MovementList(),
                      BlogList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
