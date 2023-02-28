import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/values/border_styles.dart';
import '../basket_controller.dart';

class DiscountWidget extends StatelessWidget {
  DiscountWidget({Key? key}) : super(key: key);
  final BasketController _ctrl = Get.find<BasketController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/discount.svg'),
            const SizedBox(width: 5),
            Text(
              _ctrl.discountCode,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: black),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: screenWidth,
          height: 78,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(
                      color: black, decoration: TextDecoration.none),
                  controller: _ctrl.discountController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    helperText: ' ',
                    hintText: _ctrl.enterDiscount,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: grayText2),
                    filled: true,
                    fillColor: white,
                    labelStyle: const TextStyle(color: white),
                    focusedBorder: enabledBorder2,
                    enabledBorder: enabledBorder2,
                    border: border2,
                    errorBorder: errorBorder2,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                        backgroundColor: primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(12), bottomEnd: Radius.circular(12)),
                        )),
                    child: Text(
                      _ctrl.applyDiscount,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
