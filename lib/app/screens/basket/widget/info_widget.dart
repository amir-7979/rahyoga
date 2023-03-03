import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/theme/colors.dart';
import '../basket_controller.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({Key? key}) : super(key: key);
  final BasketController _ctrl = Get.find<BasketController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/finance.svg'),
              const SizedBox(width: 5),
              Text(
                _ctrl.orderInfo,
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
                        _ctrl.numberOfCourses,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: textGray),
                      ),
                      Text(
                        _ctrl.courseCount,
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
                        _ctrl.totalPrice,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: textGray),
                      ),
                      Text(
                        _ctrl.toman,
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
                        _ctrl.discount,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: textGray),
                      ),
                      Text(
                        _ctrl.toman,
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
