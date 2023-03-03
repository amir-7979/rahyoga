import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/basket/basket_controller.dart';
import 'package:rahyoga/app/screens/basket/widget/info_widget.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../core/languages/translator.dart';
import 'widget/course_list.dart';
import 'widget/discount_widget.dart';

class BasketScreen extends StatelessWidget {
  BasketScreen({Key? key}) : super(key: key);
  final BasketController _ctrl = Get.find<BasketController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: _ctrl.back,
            color: black,
          ),
          title: Text(
            _ctrl.screenTitle,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: black),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height:80,
            child: Container(
              decoration: const BoxDecoration(
                color: favoriteGray2,
                borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(20),),
              ),
              child: SizedBox(
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
                        child: ElevatedButton(
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
                        ),
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_ctrl.totalPrice, style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: textGray)),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('1234000', style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: black)),
                              Text(_ctrl.toman2, style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: black)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),),
            ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 25),
              CourseList(),
              const SizedBox(height: 32),
              //todo staff cart
              /*StaffList(),
            const SizedBox(height: 25),*/
              DiscountWidget(),
              const SizedBox(height: 32),
              InfoWidget(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
