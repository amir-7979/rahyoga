import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';

class PurchasedCourseItem extends StatelessWidget {
  const PurchasedCourseItem({super.key});

  //final LastCourseModel _itemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            height: purchasedItemHeight,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  child: SizedBox(
                    height: purchasedItemHeight,
                    width: purchasedItemImageWidth,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CacheImage(
                          url:
                              'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 8, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'دوره حفظ و تعادل',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(color: black),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${Translator.lastSeen.tr} : ${DateTime.now().day}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: grayText2),
                                ),
                              ],
                            ),
                            Container(
                              child: CircularPercentIndicator(
                                radius:30,
                                lineWidth: 4.0,
                                percent: 0.7,
                                center: Text(
                                  "70%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: primaryColor),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${Translator.session.tr}${1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      color: grayText3,
                                    ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${Translator.continueCourse.tr}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: primaryColor,
                                        ),
                                  ),
                                    Icon(
                                        Icons.arrow_forward_outlined,
                                        color: primaryColor,
                                      )
                                ],
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
