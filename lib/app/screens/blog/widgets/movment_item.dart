import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/movement.dart';

import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';
import '../blog_controller.dart';

class MovementItem extends StatelessWidget {
  MovementItem(this.movement, {Key? key}) : super(key: key);
   BlogController controller = Get.find<BlogController>();
   final Movement movement;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> controller.gotoArticle(movement.id!, 'آسانا'),
      child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: moreTextColor),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CacheImage(
                  url: movement.image??''),
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  movement.header??'',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: black),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
