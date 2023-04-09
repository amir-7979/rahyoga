import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/models/all.dart';
import '../course_info_controller.dart';

class FutureItem extends GetView<CourseInfoController> {
  FutureItem(this.session, {Key? key}) : super(key: key);
  All session;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (session.order!=1)
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(14, 5, 0, 5),
          child: Container(
            width: 2,
            height: 20,
            color: secondaryColor,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(
                height:30, width:30,
                child: Center(child: (controller.index == session.order! - 1) ? SvgPicture.asset('assets/images/course_info/play.svg', height:28, width:28,) : SvgPicture.asset('assets/images/course_info/play2.svg', height:24, width:24,),),),
            SizedBox(width: 10),
            Text(
              session.header ?? '',
              style: (controller.index == session.order! - 1)
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
            style: (controller.index == session.order! - 1)
                ? Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: primaryColor)
                : Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: textGray2),
          ),
        ],),
      ],
    );
  }
}
