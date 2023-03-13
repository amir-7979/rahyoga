import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../data/models/course.dart';
import '../../../widgets/cache_image.dart';

class CourseItem extends StatelessWidget {
  CourseItem(this.course, {Key? key}) : super(key: key);
  HomeController controller = Get.find<HomeController>();
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: InkWell(
        onTap: () {},
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          course.header ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: black),
                        ),
                      ),
                      Text(
                        '${course.theNumberOfSeasons} ${Translator.session.tr}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: grayText2),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${Translator.mentor.tr} : ${course.mentor!.fullname ?? ''}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: grayText2),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //todo here1
                      Text(
                        Translator.toman.trParams(
                            {'number': course.price.toString() ?? ''}),
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: black),
                      ),
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: Obx(
                          () => (controller.isLoading.value == course.id)
                              ? const Center(
                                child: SizedBox(
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
                              )
                              : OutlinedButton(
                                  onPressed: () => controller
                                      .addItemToBasket(course.id ?? 0),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1, color: primaryColor),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: primaryColor,
                                    size: 20,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
