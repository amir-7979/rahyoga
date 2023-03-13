import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/course_info/course_info_controller.dart';
import 'package:rahyoga/app/screens/course_info/widgets/current_itrm.dart';
import 'package:rahyoga/app/screens/course_info/widgets/future_item.dart';
import 'package:rahyoga/app/screens/course_info/widgets/passed_item.dart';
import 'package:readmore/readmore.dart';
import '../../../core/theme/colors.dart';
import '../../data/models/paid_course_info.dart';
import '../../widgets/shimmer_screen.dart';
import '../../widgets/video_player.dart';
import 'widgets/bottom_app_bar_nav.dart';

class CourseInfoScreen extends GetView<CourseInfoController> {
  CourseInfoScreen({Key? key}) : super(key: key);

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
            controller.course != null
                ? controller.course.value!.header ?? ''
                : '',
            style: Get.theme.textTheme.headlineLarge!.copyWith(color: black),
          ),
        ),
        bottomNavigationBar: BottomAppBarNav(),
        body: FutureBuilder(
            future: controller.fetchCourse(),
            builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData)
                ? favoriteCourses(controller.course.value)
                : const SimmerScreen()),
      ),
    );
  }

  Widget favoriteCourses(PaidCourseInfo? course) {
    return course == null
        ? Container()
        : ListView(
            children: [
              const VideoPlayer(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 32,
                          width: 107,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 6, 12, 4),
                              minimumSize: const Size.fromWidth(107),
                              backgroundColor: secondaryColor,
                              elevation: 0,
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () async {
                              // TODO: fullscreen
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/course_info/full_screen.svg',
                                  width: 16,
                                  height: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  controller.fullScreen,
                                  style: Get.theme.textTheme.headlineMedium!
                                      .copyWith(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      controller.courseTitle,
                      style:
                          Get.theme.textTheme.bodySmall!.copyWith(color: black),
                    ),
                    SizedBox(height: 8),
                    ReadMoreText(
                      course.description??'',
                      trimLines: 3,
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: profileGray),
                      moreStyle: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: moreTextColor),
                      lessStyle: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: moreTextColor),
                      colorClickableText: profileGray,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: controller.more,
                      trimExpandedText: controller.less,
                    ),
                    SizedBox(height: 24),
                    Text(
                      controller.courseSession,
                      style:
                          Get.theme.textTheme.bodySmall!.copyWith(color: black),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                      child: Column(
                        children:[
                          /*for(int x = 1; x<=5;x++)...[
                            Container(
                                child: Text("$x")
                            ),
                          ],*/
                        /*PassedItem(
                          first: true,
                        ),
                          PassedItem(),
                          CurrentItem(),
                          FutureItem(),
                          FutureItem(),
                          FutureItem(),
                          controller.course.value!.progress!.seasons.all!.map((i) {
                            if(i. < controller.preIndex.value){
                            return Text(i.toString());
                            }else{

                            }
                          }).toList()*/



],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

}
