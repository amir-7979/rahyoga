import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/values/consts.dart';
import '../../../widgets/cache_image.dart';

class MiniCourseItem extends StatelessWidget {
  const MiniCourseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 5),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: generalYogaItemHeight,
          width: generalYogaItemWidth,
          child: Container(
            decoration: BoxDecoration(
                color: white,
                border: Border.all(color: generalItemBorderGray),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const CacheImage(
                        url:
                            'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'course name',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: black),
                      ),
                      Text(
                        '${8}${Translator.session.tr}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: grayText2),
                      )
                    ],
                  ),
                  const SizedBox(height: 7),
                  //todo mabe remove this
                  Text(
                    '${Translator.mentor.tr}: ${'نوشین جوادی'}',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: grayText2),
                  ),
                  const Spacer(),
                  Center(
                    child: SizedBox(
                        width: 50,
                        height: 30,
                        child: OutlinedButton(onPressed: (){}, style:  OutlinedButton.styleFrom(side: const BorderSide( color: primaryColor), ), child:  const Icon(Icons.add, color: primaryColor, size: 20,))),
                  ),
                  const SizedBox(height: 5,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
