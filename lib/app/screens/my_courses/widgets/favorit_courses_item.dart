import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/liked_course.dart';
import 'package:rahyoga/app/screens/my_courses/my_courses_controller.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';

class FavoriteCourseItem extends StatelessWidget {
  FavoriteCourseItem(this.likedCourse, {Key? key}) : super(key: key);
  var controller = Get.find<MyCoursesController>();
  final LikedCourse likedCourse;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.gotoBuyCourse(likedCourse.id!.toInt()),
      child: SizedBox(
        height: favoriteItemHeight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: moreTextColor),
          ),
          child: Row(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  height: favoriteItemHeight - 10,
                  width: favoriteItemHeight + 5,
                  child: ClipRRect(
                    borderRadius: const BorderRadiusDirectional.all(Radius.circular(12)),
                    child: CacheImage(url: likedCourse.image ?? ''),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 7, 5, 0),
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
                                    .copyWith(
                                        color: black,
                                        overflow: TextOverflow.ellipsis),
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
                            const EdgeInsetsDirectional.only(top: 2),
                        child: Text(
                          '${Translator.mentor.tr} : ${likedCourse.mentor!.fullname ?? ''}',
                          style: Get.theme.textTheme.headlineSmall!
                              .copyWith(color: grayText2),
                        ),
                      ),
                      SizedBox(height: 5),
                      const Divider(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Translator.toman.trParams(
                                {'number': likedCourse.offer.toString() ?? ''}),
                            style: Get.theme.textTheme.headlineMedium!
                                .copyWith(color: black),
                          ),
                          SizedBox(
                            height: 38,
                            child: Obx(
                              () => (controller.isLoading.value ==
                                      likedCourse.id)
                                  ? Center(
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: AspectRatio(
                                              aspectRatio: 1,
                                              child: CircularProgressIndicator(
                                                color: primaryColor,
                                                strokeWidth: 2,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          )
                                        ],
                                      ),
                                    )
                                  : TextButton(
                                      onPressed: () => controller
                                          .addItemToBasket(likedCourse.id!),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(
                                              '${Translator.buyCourse.tr}',
                                              style: Get
                                                  .theme.textTheme.headlineMedium!
                                                  .copyWith(
                                                      color: primaryColor),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.add_circle_outline,
                                            color: primaryColor,
                                          )
                                        ],
                                      ),
                                    ),
                            ),
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
      ),
    );
  }
}
