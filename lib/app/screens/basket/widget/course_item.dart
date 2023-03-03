import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';
import '../basket_controller.dart';

class CourseItem extends StatelessWidget {

  final BasketController _ctrl = Get.find<BasketController>();

  CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const CacheImage(
                            url:
                                'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
/*
                      child: Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: ElevatedButton(SvgPicture.asset('assets/images/edit.svg'), color: white, onPressed: (){}, iconSize: 15, icon: ,
                        ),
                      ),
*/
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'دوره‌ی مقدماتی اصول یوگا به سدوره‌ی مقدماتی اصول یوگا به سدوره‌ی مقدماتی اصول یوگا به س',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: black,
                                overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'نوشین جوادی',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                            color: textGray,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Text(
                      _ctrl.toman,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                          color: profileGray,
                          decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _ctrl.toman,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
