import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/payment/payment_controller.dart';
import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentScreen extends GetView<PaymentController> {
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
              'پرداخت',
              style: Get.theme.textTheme.headlineLarge!.copyWith(color: black),
            )),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Center(child: Image.asset('assets/images/basket/payment.jpg')),
              SizedBox(height: 5),
              Text(
                'هم اکنون تنها روش کارت به کارت فعال است.',
                style: Get.textTheme.labelMedium!
                    .copyWith(color: primaryColor, fontSize: 13),
                maxLines: 2,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    text: 'پس از پرداخت مبلغ، رسید را به',
                  style: Get.textTheme.labelMedium!
                      .copyWith(color: primaryColor, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' ${controller.seller.telegramID.toString().split('/').last}@ ',
                      style: TextStyle(color: Colors.blueAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launch(controller.seller.telegramID),
                    ),
                    TextSpan(text: 'در تلگرام ارسال نمایید. \n\n پس از چند دقیقه دوره های آموزشی خریداری شده برای شما فعال خواهند شد.'),
                  ],
                ),
                maxLines: 6,
              ),
              SizedBox(height: 10),
              Text(
                '',
                style: Get.textTheme.labelMedium!
                    .copyWith(color: black, fontSize: 14),
                maxLines: 4,
              ),

              /*InkWell(
                  child: Text(
                      '@${controller.basket.value!.seller.telegramID.toString().split('/').last}',
                      style: Get.textTheme.displayLarge!.copyWith(
                        color: black,
                        decoration: TextDecoration.underline,
                      ),
                      textDirection: TextDirection.ltr),
                  onTap: () => launch(_controller.basket.value!.seller.telegramID)),*/
            ],
          ),
        ),
      ),
    );
  }
}
