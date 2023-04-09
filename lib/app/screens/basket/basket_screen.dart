import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/basket/basket_controller.dart';
import 'package:rahyoga/app/screens/basket/widget/info_widget.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'package:rahyoga/core/values/consts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/languages/translator.dart';
import '../../data/models/basket.dart';
import '../../widgets/shimmer_screen.dart';
import 'widget/result_list.dart';

class BasketScreen extends GetView<BasketController> {
  BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: controller.back,
            color: black,
          ),
          title: Text(
            controller.screenTitle,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: black),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: Container(
            decoration: const BoxDecoration(
              color: favoriteGray2,
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
                    child: Obx(
                      () => (controller.basket.value!.totalOffer != 0)
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromWidth(200),
                                backgroundColor: primaryColor,
                                elevation: 0,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () async {
                                // TODO: Implement paymet method
                              },
                              child: Text(
                                Translator.pay.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(color: white),
                              ),
                            )
                          : Container(),
                    ),
                  ),
                  SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.totalPrice2,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: textGray)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                                controller.basket.value!.totalPrice.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: black)),
                          ),
                          Text(' ${controller.toman2}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: black)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: GetBuilder<BasketController>(
            init: controller,
            builder: (context) => context.basket.value!.count == null
                ? const SimmerScreen()
                : basket(controller.basket.value!)
        ),
      ),
    );
  }

  Widget basket(Basket basket) {
    return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 25),
                CourseList(basket.results??[]),
                //const SizedBox(height: 32),
                /*DiscountWidget(),*/
                const SizedBox(height: 32),
                InfoWidget(basket),
                const SizedBox(height: 15),
              ],
            ),
          );
  }
}
