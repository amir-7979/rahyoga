import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../course_info_controller.dart';

class BottomAppBarNav extends StatelessWidget {
  BottomAppBarNav({Key? key}) : super(key: key);
  final CourseInfoController _ctrl = Get.find<CourseInfoController>();

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 22),
      height:80,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: favoriteGray2,
        borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(20),),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('درصد پیشرفت', style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: profileGray)),
              const SizedBox(height: 4),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsetsDirectional.zero,
                  minimumSize: const Size.fromWidth(70),
                  elevation: 0,
                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  // TODO: Implement paymet method
                },
                child: Row(
                  children: [
                    Icon(Icons.chevron_left, color: primaryColor),
                    Text(
                    _ctrl.prev,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: primaryColor),
                    ),

                  ],
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsetsDirectional.zero,
                  minimumSize: const Size.fromWidth(110),
                  backgroundColor: primaryColor,
                  elevation: 0,

                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  // TODO: Implement paymet method
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      _ctrl.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: white),
                    ),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
