import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../course_info_controller.dart';

class CurrentItem extends StatelessWidget {
  CurrentItem({Key? key}) : super(key: key);
  final CourseInfoController _ctrl = Get.find<CourseInfoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(14, 5, 0, 5),
          child: Container(
            width: 2,
            height: 20,
            color: primaryColor,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              SizedBox(
                  height:30, width:30,
                  child: Center(child: SvgPicture.asset('assets/images/course_info/play.svg', height:30, width:30))),
              SizedBox(width: 10),
              Text(_ctrl.courseTitle, style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: primaryColor),),
            ],
            ),
            Text(_ctrl.duration, style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: primaryColor),),
          ],),

      ],
    );
  }
}
