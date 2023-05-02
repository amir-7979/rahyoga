import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/basket/basket_controller.dart';
import '../../../../core/theme/colors.dart';
import '../../buy_course/buy_course_controller.dart';
import 'package:url_launcher/url_launcher.dart';

final BasketController _controller = Get.find<BasketController>();

Dialog CartDialog() {
  return Dialog(
    elevation: 5,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    child: SizedBox(
      height: 350,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Row(
              children: [
                IconButton(
                    onPressed: () => _controller.closeDialog(), icon: const Icon(Icons.close)),
                Text(
                  'اطلاعات خرید',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const Divider(height: 1),
            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('شماره کارت', style: Get.textTheme.displayLarge!.copyWith(color: black)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_controller.basket.value!.seller.bankAccountNumber, style: Get.textTheme.displayLarge!.copyWith(color: black)),
                    ],
                  ),
                  SizedBox(height: 10),

                  Text('شماره تماس', style: Get.textTheme.displayLarge!.copyWith(color: black)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_controller.basket.value!.seller.phone, style: Get.textTheme.displayLarge!.copyWith(color: black), textDirection: TextDirection.ltr),
                    ],
                  ),
                  SizedBox(height: 10),

                  Text('آیدی تلگرام', style: Get.textTheme.displayLarge!.copyWith(color: black)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          child: Text('@${_controller.basket.value!.seller.telegramID.toString().split('/').last}', style: Get.textTheme.displayLarge!.copyWith(color: black, decoration: TextDecoration.underline, )
                          , textDirection: TextDirection.ltr),
                          onTap: () => launch(_controller.basket.value!.seller.telegramID)
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  Text('مبلغ', style: Get.textTheme.displayLarge!.copyWith(color: black)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(_controller.basket.value!.totalPrice.toString(), style: Get.textTheme.displayLarge!.copyWith(color: black)),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30,),

          ],
        ),
      ),
    ),
  );
}
