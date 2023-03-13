import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
           ResultItem(item)

      ],
    );

  }
}
