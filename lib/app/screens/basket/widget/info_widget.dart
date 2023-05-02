import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/theme/colors.dart';
import '../../../data/models/basket.dart';
import '../basket_controller.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget(this.basket);
  BasketController controller = Get.find<BasketController>();
  Basket basket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/basket/finance.svg'),
              const SizedBox(width: 5),
              Text(
                controller.orderInfo,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: black),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: moreTextColor),),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.numberOfCourses,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: textGray),
                      ),
                      Text(
                        basket.count.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: black),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: Divider(height: 1),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.totalPrice,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: textGray),
                      ),
                      Text(
                        basket.totalOffer??'',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: black),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: Divider(height: 1),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(vertical: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.discount,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: textGray),
                      ),
                      Text(
                        basket.difference??'',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: black),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: Divider(height: 1),
                ),
            ],),
          ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
