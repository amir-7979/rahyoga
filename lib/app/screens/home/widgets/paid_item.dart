import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../data/models/course.dart';
import '../../../widgets/cache_image.dart';

class PaidItem extends StatelessWidget {
  PaidItem(this.course, {Key? key}) : super(key: key);
  HomeController controller = Get.find<HomeController>();
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: InkWell(
        onTap: () => controller.gotoCourseInfo(course.id!.toInt()??1),
        child: SizedBox(
          height: generalYogaItemHeight,
          width: generalYogaItemWidth,
          child: Container(
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: moreTextColor),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(7, 7, 7, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: AspectRatio(
                      aspectRatio: 140 / 105,
                      child: CacheImage(url: course.image ?? ''),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    course.header ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: black),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${Translator.mentor.tr}: ${course.mentor!.fullname ?? ''}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: grayText2),
                      ),
                      Text(
                        '${course.theNumberOfSeasons} ${Translator.session.tr}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: grayText2),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
