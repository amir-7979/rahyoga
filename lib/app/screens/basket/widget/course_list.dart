import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../basket_controller.dart';
import 'course_item.dart';

class CourseList extends StatelessWidget {
  CourseList({Key? key}) : super(key: key);
  final BasketController _ctrl = Get.find<BasketController>();

  var items = [1, 1, 1];

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
                _ctrl.ordersTitle,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: black,
                    ),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/images/red_delete.svg'),
                  const SizedBox(width: 8),
                  Text(
                    '${_ctrl.deleteAll}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: redError,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        for (int i in items)
          Column(
            children: [
              CourseItem(),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                child: Divider(height: 1),
              ),
            ],
          )
      ],
    );

  }
}
