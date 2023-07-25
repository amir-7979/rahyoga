import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/basket/widget/result_item2.dart';
import 'package:rahyoga/core/values/consts.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/models/result.dart';
import '../basket_controller.dart';
import 'result_item.dart';

class CourseList extends StatelessWidget {
  CourseList(this.results, {Key? key}) : super(key: key);
  final BasketController controller = Get.find<BasketController>();
  List<Result> results;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
            Translator.courses2.trParams({'number':results.length.toString()}),
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: black,
                    ),
              ),
             /* Row(
                children: [
                  SvgPicture.asset('assets/images/red_delete.svg'),
                  const SizedBox(width: 8),
                  Text(
                    '${controller.deleteAll}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: redError,
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),
         for(var item in results)
           if (screenWidth < 450 ) ResultItem(item) else ResultItem2(item)

      ],
    );

  }
}
