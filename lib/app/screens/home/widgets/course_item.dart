import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../data/models/course.dart';
import '../../../widgets/cache_image.dart';

class CourseItem extends GetWidget<HomeController> {
  CourseItem(this.course, {Key? key}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: InkWell(
        onTap: () => controller.gotoBuyCourse(course.id!.toInt()),
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
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: AspectRatio(
                          aspectRatio: 140 / 105,
                          child: CacheImage(url: course.image ?? ''),
                        ),
                      ),
                      if (course.offer_percent! > 0)
                        Container(
                          height: 20,
                          width: 37,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(
                              child: Text(
                            '% ${course.offer_percent}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: black),
                          )),
                        )
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        Translator.toman
                            .trParams({'number': course.offer ?? ''}),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
