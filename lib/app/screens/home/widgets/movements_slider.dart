import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/movement.dart';
import 'package:rahyoga/core/values/consts.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../home_controller.dart';
import 'movement_item.dart';

class MovementsSlider extends StatelessWidget {
  MovementsSlider(this.movements, {super.key});
  final List<Movement> movements;
  final HomeController controller = Get.find<HomeController>();
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
        child: Row(
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
              onPressed: () {controller.gotoTab(2);},
              child: Text(
                Translator.seeAll.tr,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: primaryColor, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: screenWidth,
        child: CarouselSlider.builder(
          itemCount: movements.length,
          itemBuilder: (BuildContext ctx, index, index2) {
            return MovementItem(movements[index]);
          },
          carouselController: _controller,
          options: CarouselOptions(
            enableInfiniteScroll: false,
            height: 200,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (index, reason) {
                controller.setSliderIndex(index);
              }),
        ),
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: movements.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Obx(
              () => Container(
                width: (controller.sliderIndex.value == entry.key) ? 8.2 : 7.0,
                height: (controller.sliderIndex.value == entry.key) ? 8.2 : 7.0,
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (controller.sliderIndex.value == entry.key
                            ? primaryColor
                            : sliderDotGray)
                        .withOpacity(
                            controller.sliderIndex.value == entry.key ? 0.99 : 0.5)),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
