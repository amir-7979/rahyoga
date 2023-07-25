import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/values/consts.dart';
import '../../../widgets/proggress_bar.dart';
import '../../../widgets/shimmer_screen.dart';
import '../course_info_controller.dart';

class BottomAppBarNav extends GetView<CourseInfoController> {
  BottomAppBarNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseInfoController>(
      init: controller,
      builder: (context) => context.course.value!.id == null
          ? const SimmerScreen()
          : Container(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 22),
              height: 80,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: fourthColor,
                borderRadius: BorderRadiusDirectional.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('درصد پیشرفت',
                          style: Get.theme.textTheme.headlineSmall!
                              .copyWith(color: profileGray)),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ShimmerProgressBar(
                                controller.course.value!.progress!.progress),
                            SizedBox(width: 12),
                            Container(
                              width: 40,
                              child: Center(
                                child: Text(
                                  '${(controller.course.value!.progress!.progress * 100).toInt()}%',
                                  style: Get.theme.textTheme.displayMedium!
                                      .copyWith(
                                    color: black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (controller.index.value > 1)
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsetsDirectional.zero,
                            minimumSize: const Size.fromWidth(70),
                            elevation: 0,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            controller.goToSession(controller.index.value - 1);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.chevron_left, color: primaryColor),
                              Text(
                                controller.prev,
                                style: Get.theme.textTheme.titleSmall!
                                    .copyWith(color: primaryColor),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(width: 12),
                      if (controller.course.value!.id != null &&
                          controller.index.value <
                              controller.course.value!.theNumberOfSeasons!)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsetsDirectional.zero,
                            minimumSize: const Size.fromWidth(110),
                            backgroundColor: primaryColor,
                            elevation: 0,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            controller.goToSession(controller.index.value + 1, );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                controller.next,
                                style: Get.theme.textTheme.headlineMedium!
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
            ),
    );
  }
}
