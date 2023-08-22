import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../widgets/shimmer_screen.dart';
import '../basket_controller.dart';

class BottomBar extends GetWidget<BasketController> {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BasketController>(
        init: controller,
        builder: (context) => context.basket.value!.count == null
            ? const SimmerScreen() : SizedBox(
        height: 80,
        child: Container(
          decoration: const BoxDecoration(
            color: fourthColor,
            borderRadius: BorderRadiusDirectional.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: SizedBox(
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                  const EdgeInsetsDirectional.symmetric(vertical: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromWidth(200),
                      backgroundColor: primaryColor,
                      elevation: 0,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: controller.gotoPayment,
                    child: Text(
                      Translator.pay.tr,
                      style: Get.theme
                          .textTheme
                          .displayLarge!
                          .copyWith(color: white),
                    ),
                  ),
                ),
                if(controller.basket.value!.results != null &&
                    controller.basket.value!.results!.isNotEmpty) SizedBox(
                    width: 40),
                if(controller.basket.value!.results != null &&
                    controller.basket.value!.results!.isNotEmpty) Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.totalPrice2,
                      style: Get.theme
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textGray),),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Obx(
                              () =>
                              Text(
                                  controller.basket.value!.totalPrice
                                      .toString(),
                                  style: Get.theme
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: black)),
                        ),
                        Text(' ${controller.toman2}',
                          style: Get.theme
                              .textTheme
                              .displayMedium!
                              .copyWith(color: black),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
