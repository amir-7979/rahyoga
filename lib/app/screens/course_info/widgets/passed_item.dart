import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../course_info_controller.dart';

class PassedItem extends StatelessWidget {
  PassedItem({bool? this.first, Key? key}) : super(key: key);
  final CourseInfoController _ctrl = Get.find<CourseInfoController>();
  bool? first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if((first == null) || (!first!)) Padding(
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
                  child: Center(child: SvgPicture.asset('assets/images/course_info/check.svg', height: 24, width: 24))),
              const SizedBox(width: 10),

              Text(_ctrl.courseTitle, style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
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
