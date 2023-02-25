import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';

class FavoriteCourseItem extends StatelessWidget {
  const FavoriteCourseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: favoriteItemHeight,
        child: Container(
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: generalItemBorderGray),),
          child: Row(
            children: [
              SizedBox(
                height: favoriteItemHeight,
                width: favoriteItemHeight,
                child: const ClipRRect(
                  borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(12)),
                  child: CacheImage(
                      url:
                      'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsetsDirectional.fromSTEB(10, 8, 5, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'اسم دوره',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: black),
                            ),
                            Text(
                              '${1}${Translator.session.tr}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                color: favoriteGray
                              ),
                            ),
                          ],
                        ),
                      ),
                      //todo maybe remove this
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(vertical: 7),
                        child: Text('مربی : فلانی', style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                            color: grayText2),),
                      ),
                      Divider(height: 1),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${700000} ${Translator.toman.tr}',
                              style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                            color: black),),
                          TextButton(
                            onPressed: (){},
                            child: Row(children: [
                              Text('${Translator.buyCourse.tr}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                    color: primaryColor),),
                              SizedBox(width: 4),
                              Icon(Icons.add_circle_outline, color: primaryColor,)
                            ],),
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
