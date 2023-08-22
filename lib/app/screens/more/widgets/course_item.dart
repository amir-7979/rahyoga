import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/liked_course.dart';
import 'package:rahyoga/app/screens/more/more_controller.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';

class CourseItem extends StatelessWidget {
  CourseItem(this.likedCourse, {Key? key}) : super(key: key);
  var controller = Get.find<MoreController>();
  final LikedCourse likedCourse;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.gotoBuyCourse(likedCourse.id!.toInt()),
      child: SizedBox(
        height: favoriteItemHeight,
        child: Row(
          children: [
            SizedBox(
              height: favoriteItemHeight,
              width: favoriteItemHeight,
              child: ClipRRect(
                borderRadius: const BorderRadiusDirectional.all(
                     Radius.circular(12)),
                child: CacheImage(url: likedCourse.image ?? ''),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 5, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 3, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              likedCourse.header ?? '',
                              style: Get.theme.textTheme.displayMedium!
                                  .copyWith(color: black),
                            ),
                          ),
                          Text(
                            '${likedCourse.theNumberOfSeasons} ${Translator.session.tr}',
                            style: Get.theme.textTheme.headlineSmall!
                                .copyWith(color: black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 7),
                      child: Text(
                        '${Translator.mentor.tr} : ${likedCourse.mentor!.fullname ?? ''}',
                        style: Get.theme.textTheme.headlineSmall!
                            .copyWith(color: grayText2),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Translator.toman.trParams(
                              {'number': likedCourse.offer??''}),
                          style: Get.theme.textTheme.displayLarge!
                              .copyWith(color: black),
                        ),
                        Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(
                                      '${Translator.buyCourse.tr}',
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(color: primaryColor),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.add_circle_outline,
                                    color: primaryColor,
                                  )
                                ],
                        ),
                      ],
                    ),
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
