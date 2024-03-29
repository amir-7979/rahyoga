import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/home/home_controller.dart';

import '../../../../core/theme/colors.dart';
import '../../../data/models/movement.dart';
import '../../../widgets/cache_image.dart';

class MovementItem extends StatelessWidget {
  MovementItem(this.movement, {Key? key}) : super(key: key);
  final Movement movement;
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.gotoArticle(movement.id ?? 1, 'آسانا'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 330,
            height: 170,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1),
                  borderRadius: BorderRadius.circular(12.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CacheImage(url: movement.image ?? ''),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 10, 0, 0),
            child: Text(
              movement.header ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: black),
            ),
          ),
        ],
      ),
    );
  }
}
