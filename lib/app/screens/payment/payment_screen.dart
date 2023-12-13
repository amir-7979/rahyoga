import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/payment/payment_controller.dart';
import '../../../core/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
            elevation: 0.5,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.black,
            leading: BackButton(
              onPressed: controller.back,
              color: black,
            ),
            title: Text(
              'پرداخت',
              style: Get.theme.textTheme.headlineLarge!.copyWith(color: black),
            )),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Center(child: Image.asset('assets/images/basket/payment.jpg')),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'مبلغ قابل پرداخت : ${controller.price}  تومان',
                    style: Get.textTheme.labelMedium!
                        .copyWith(color: primaryColor, fontSize: 14),
                    maxLines: 2,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text:
                  ' ${controller.seller.telegramID.toString().split('/').last}@ ',
                  style: TextStyle(color: Colors.blueAccent),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launch(controller.seller.telegramID),
                ),
              ),

              /*InkWell(
                  child: Text(
                      '@${controller.seller.telegramID.toString().split('/').last}',
                      style: Get.textTheme.displayLarge!.copyWith(
                        color: black,
                        decoration: TextDecoration.underline,
                      ),
                      textDirection: TextDirection.ltr),
                  onTap: () => launch(controller.seller.telegramID)),
*/

            ],
          ),
        ),
      ),
    );
  }
}
