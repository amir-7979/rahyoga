import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../../core/values/consts.dart';
import '../../data/models/buy_course_info.dart';
import '../../widgets/cache_image.dart';
import '../../widgets/shimmer_screen.dart';
import 'buy_course_controller.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/course_list.dart';

class BuyCourseScreen extends GetView<BuyCourseController> {
  BuyCourseScreen({Key? key}) : super(key: key);

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
            controller.courseDetail,
            style: Get.theme.textTheme.headlineLarge!.copyWith(color: black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15),
              child: InkWell(
                onTap: controller.addToFavorite,
                child: Row(
                  children: [
                    //todo like course
                    Obx(() => SvgPicture.asset(controller.isLiked.value == true
                        ? 'assets/images/filled_star.svg'
                        : 'assets/images/star.svg')),
                    const SizedBox(width: 4),
                    Text(
                      controller.save,
                      style: Get.theme.textTheme.headlineMedium!.copyWith(
                        color: black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Obx(()=> (controller.course.value!.offer != null) ? BottomBar() : SizedBox(height: 1,)),
        body: GetBuilder<BuyCourseController>(
            init: BuyCourseController(),
            builder: (context) =>
                context.isLoading.value || controller.course.value!.id == null
                    ? const SimmerScreen()
                    : buyCourse(controller.course.value!)),
      ),
    );
  }

  Widget buyCourse(BuyCourseInfo course) {
    return ListView(
      children: [
        if(controller.course.value!.preview != null) SizedBox(
            height: 200,
            width: screenWidth,
            child: WebViewWidget(controller: controller.videoPlayerController!,),),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 10, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth - 95,
                    child: Text(
                      course.header ?? '',
                      style: Get.theme.textTheme.headlineLarge!
                          .copyWith(color: black),
                    ),
                  ),
                  Text(
                    Translator.session2.trParams(
                        {'number': course.theNumberOfSeasons.toString()}),
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(color: grayText4),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(height: 15),
              ReadMoreText(
                course.description ?? '',
                trimLines: 5,
                style: Get.theme.textTheme.bodyMedium!
                    .copyWith(color: profileGray, height: 1.3),
                moreStyle: Get.theme.textTheme.bodyMedium!
                    .copyWith(color: moreTextColor),
                lessStyle: Get.theme.textTheme.bodyMedium!
                    .copyWith(color: moreTextColor),
                colorClickableText: profileGray,
                trimMode: TrimMode.Line,
                trimCollapsedText: controller.more,
                trimExpandedText: ' ${controller.less}',
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 14, 12),
                decoration: const BoxDecoration(
                    color: fourthColor,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CacheImage(
                            url: course.mentor!.image ?? '',
                            imageBuilder: true,
                            height: 54),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 5, 0, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.mentor,
                                style: Get.theme.textTheme.headlineSmall!
                                    .copyWith(color: black),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                course.mentor!.fullname ?? '',
                                style: Get.theme.textTheme.headlineMedium!
                                    .copyWith(color: black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.courseSession,
                    style: Get.theme.textTheme.displayLarge!.copyWith(color: black),
                  ),
                  Text(
                    controller.course.value!.durationPersian??'',
                    style:Get.theme.textTheme.displayMedium!.copyWith(color: black),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 0, 5),
          child: CourseList(course.progress!.seasons.all ?? []),
        ),
      ],
    );
  }

}
