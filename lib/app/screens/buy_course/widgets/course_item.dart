import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../buy_course_controller.dart';

class CourseItem extends StatelessWidget {
  CourseItem({Key? key}) : super(key: key);
  final BuyCourseController _ctrl = Get.find<BuyCourseController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(

            childrenPadding: EdgeInsetsDirectional.zero,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadiusDirectional.all(Radius.circular(12))
                    ),
                    child: Center(
                      child: Text('${1}', style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: primaryColor),),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    _ctrl.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: primaryColor),
                  ),
                ],),
                Text(
                  _ctrl.duration,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: grayText2),
                ),
              ],
            ),
            // Contents
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 47),
                child: Text(
                  '${'long text'}${'\n'}',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: grayText2),
                ),
              ),]),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
          child: Divider(height: 1),
        ),
      ],
    );
  }
}
