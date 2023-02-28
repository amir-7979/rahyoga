import 'package:flutter/material.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../../../core/values/consts.dart';
import '../../../widgets/cache_image.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: yogaMovementHeight,
      width: screenWidth,
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CacheImage(
                    url:
                    'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 5, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عنوان مطلب که میتونه طولانی باشه عنوان مطلب که میتونه طولانی باشه ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: primaryColor, overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'یه خط راجع به اینکه چی قراره بخونه تو این قسمتیه خط راجع به اینکه چی قراره بخونه تو این قسمتیه خط راجع به اینکه چی قراره بخونه تو این قسمت',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: black,  overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.keyboard_arrow_left)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
