import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';
import '../home_controller.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({Key? key}) : super(key: key);
  final HomeController _ctrl = Get.find<HomeController>();

  final CarouselController _controller = CarouselController();
  var imageSliders = [
    SizedBox(
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: const CacheImage(
            url:
            'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
      ),
    ),
    SizedBox(
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: const CacheImage(
            url:
            'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
      ),
    ),
    SizedBox(
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: const CacheImage(
            url:
            'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
      ),
    ),
    SizedBox(
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: const CacheImage(
            url:
            'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
      ),
    ),
    SizedBox(
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: const CacheImage(
            url:
            'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Translator.yogaMovements.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: black),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              Translator.seeAll.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(
                  color: primaryColor,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      SizedBox(
        width: screenWidth,
        child: CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            //autoPlay: true,
            height: 170,
            enlargeCenterPage: true,

            //aspectRatio: 20/9,
            onPageChanged: (index, reason) {
                 _ctrl.setSliderIndex(index);
                }),
        ),
      ),
       SizedBox(height: 5),
       Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageSliders.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Obx(
                () => Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (_ctrl.sliderIndex.value == entry.key ? primaryColor : sliderDotGray)
                          .withOpacity(_ctrl.sliderIndex.value == entry.key ? 0.9 : 0.4)),
                ),
              ),
            );
          }).toList(),
        ),
    ]);
  }
}
