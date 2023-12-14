import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../buy_course_controller.dart';

class BottomBar extends GetView<BuyCourseController> {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
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
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromWidth(200),
                    backgroundColor: primaryColor,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () async {
                    controller.addItemToBasket(controller.id ?? 0);
                  },
                  child: Obx(
                    () => (controller.isLoading.value)
                        ? Center(
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          )
                        : Text(
                            controller.buyCourse,
                            style: Get.theme.textTheme.displayLarge!
                                .copyWith(color: white),
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                        controller.cost,
                        style: Get.theme.textTheme.headlineSmall!
                            .copyWith(color: textGray)),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () =>  (controller.course.value!.offerPercent == 0)
                        ? Text(
                            Translator.toman.trParams({
                              'number': controller.course.value!.offer ?? ''
                            }),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: black,
                                ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                Translator.toman.trParams({
                                  'number':
                                      controller.course.value!.price ?? ''
                                }),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: profileGray,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                Translator.toman.trParams({
                                  'number':
                                      controller.course.value!.offer ?? ''
                                }),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      color: black,
                                    ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
