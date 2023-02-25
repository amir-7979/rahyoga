import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../../core/languages/translator.dart';
import 'widgets/general_course_list.dart';
import 'widgets/last_course_item.dart';
import 'widgets/image_slider.dart';
import 'widgets/mini_course_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          Translator.app_name.tr,
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //todo search function
            },
            icon: SvgPicture.asset('assets/images/search.svg'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: IconButton(
              onPressed: () {
                //todo buy function
              },
              icon: SvgPicture.asset('assets/images/basket.svg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 5, 20),
        child: ListView(
          children: [
            LastCourseItem(),
            SizedBox(height: 25),
            GeneralCourseList(),
            SizedBox(height: 25),
            ImageSlider(),
            SizedBox(height: 25),
            MiniCourseList(),
          ],
        ),
      ),
    );
  }
}
