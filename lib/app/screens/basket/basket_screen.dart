import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/basket/basket_controller.dart';
import 'package:rahyoga/app/screens/basket/widget/info_widget.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../data/models/basket.dart';
import '../../widgets/shimmer_screen.dart';
import '../basket/widget/bottom_bar.dart';
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
        bottomNavigationBar: GetBuilder<BasketController>(
          init: controller,
          builder: (context) => BottomBar(),
        ),
        body: GetBuilder<BasketController>(
            init: controller,
            builder: (context) => context.basket.value!.count == null
                ? const SimmerScreen()
                : basket(controller.basket.value!)),
      ),
    );
  }

  Widget basket(Basket basket) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const SizedBox(height: 25),
          CourseList(basket.results ?? []),
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
