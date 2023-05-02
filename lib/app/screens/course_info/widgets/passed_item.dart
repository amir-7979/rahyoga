import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/models/all.dart';
import '../course_info_controller.dart';

class PassedItem extends GetView<CourseInfoController> {
  PassedItem(this.session, {Key? key}) : super(key: key);
  All session;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> controller.goToSession(session.order??1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (session.order!=1)
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(13.5, 5, 0, 5),
              child: Container(
                width: 2,
                height: 20,
                color: primaryColor,
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: Center(
                          child: (controller.index == session.order!)
                              ? SvgPicture.asset(
                                  'assets/images/course_info/green_check.svg',
                                  height: 26,
                                  width: 26)
                              : SvgPicture.asset(
                                  'assets/images/course_info/check.svg',
                                  height: 24,
                                  width: 24),),),
                  const SizedBox(width: 10),
                  Text(
                    session.header ?? '',
                    style: (controller.index == session.order!)
                        ? Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: primaryColor)
                        : Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: textGray2),
                  ),
                ],
              ),
              Text(
                session.durationPersian ?? '',
                style: (controller.index == session.order!)
                    ? Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: primaryColor)
                    : Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: textGray2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
