import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/course_info/course_info_controller.dart';
import 'package:rahyoga/app/screens/course_info/widgets/current_itrm.dart';
import 'package:rahyoga/app/screens/course_info/widgets/future_item.dart';
import 'package:rahyoga/app/screens/course_info/widgets/passed_item.dart';
import 'package:readmore/readmore.dart';

import '../../../core/theme/colors.dart';
import '../../../core/values/consts.dart';
import '../../widgets/video_player.dart';
import 'widgets/bottom_app_bar_nav.dart';
import 'widgets/session_list.dart';

class CourseInfoScreen extends StatelessWidget {
  CourseInfoScreen({Key? key}) : super(key: key);
  final CourseInfoController _ctrl = Get.find<CourseInfoController>();
  var items = [1,1,1];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: BackButton(
            onPressed: _ctrl.back,
            color: black,
          ),
          title: Text(
            'دوره فلان',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: black),
          ),

        ),
        bottomNavigationBar: BottomAppBarNav(),
        body: ListView(
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
                           padding: const EdgeInsetsDirectional.fromSTEB(12, 6, 12, 4),
                           minimumSize: const Size.fromWidth(107),
                           backgroundColor: secondaryColor,
                           elevation: 0,
                           shape: const StadiumBorder(),
                         ),
                         onPressed: () async {

                           // TODO: Implement paymet method
                         },
                         child: Row(
                           children: [
                             SvgPicture.asset('assets/images/course_info/full_screen.svg', width: 16, height: 16,),
                             const SizedBox(width: 5),
                             Text(
                               _ctrl.fullScreen,
                               style: Theme.of(context)
                                   .textTheme
                                   .headlineMedium!
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
                   _ctrl.courseTitle,
                   style: Theme.of(context)
                       .textTheme
                       .bodySmall!
                       .copyWith(color: black),
                 ),
                 SizedBox(height: 8),
                 ReadMoreText('لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
                   trimLines: 3,
                   style: Theme.of(context)
                       .textTheme
                       .bodyMedium!
                       .copyWith(color: profileGray),
                   moreStyle: Theme.of(context)
                     .textTheme
                     .bodyMedium!
                     .copyWith(color: moreTextColor),
                   lessStyle: Theme.of(context)
                       .textTheme
                       .bodyMedium!
                       .copyWith(color: moreTextColor),
                   colorClickableText: profileGray,
                   trimMode: TrimMode.Line,
                   trimCollapsedText: _ctrl.more,
                   trimExpandedText: _ctrl.less,
                   textDirection: Directionality.of(context),
                 ),
                 SizedBox(height: 24),
                 Text(
                   _ctrl.courseSession,
                   style: Theme.of(context)
                       .textTheme
                       .bodySmall!
                       .copyWith(color: black),
                 ),
                 SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                    child: Column(children: [
                      PassedItem(first: true,),
                      PassedItem(),
                      CurrentItem(),
                      FutureItem(),
                      FutureItem(),
                      FutureItem(),
                    ],),
                  ),


               ],
             ),
           ),
           /* Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromWidth(200),
                        backgroundColor: greenButtonColor,
                        elevation: 0,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () async {

                        // TODO: Implement paymet method
                      },
                      child: Text(
                        _ctrl.buyCourse,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: white),
                      ),
                    )
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _ctrl.courseName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: black),
                      ),
                      Text(
                        _ctrl.session2,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: grayText4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ReadMoreText('jgjhgf hg fhgfk hgkhgxkh gxk hg fljkbm bvbvxbf dag eewytrt iuoiyiu[p ojgj hgfhgf hgfkh gkhgxk hgxkhgfljkb,'
                      'mnbvbvxb fdag eewytr tiu oiyiu[pojg jh gfhgfhgfkhg  hgxkhgxkhgf ljkb,mnbv bvxbfdage ew ytrtiuoiyiu[po'
                      'jgjhgf gfh gfkhgkhgxk hgxkhgflj kbmnbvb vxbfdageew trtiuoiyiu[pojgjh hgfhgfkhgkh xkhgxkhgfljkb,'
                      'mn bvbvxbfdag eewytrti uoiyiu[ pojgjhgfhgfhg fkhgkhgxkh gxkhgfljkb,mnb vbvxbfda geewytr tiuoiyiu[po',
                    trimLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: profileGray),
                    colorClickableText: profileGray,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: _ctrl.more,
                    trimExpandedText: _ctrl.less,
                    textDirection: Directionality.of(context),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(14, 12, 14, 12),
                    decoration: const BoxDecoration(
                        color: profilePurple,
                        borderRadius: BorderRadiusDirectional.all(Radius.circular(12))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(12, 5, 0, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _ctrl.mentor,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'نوشین جوادی',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            )],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    _ctrl.courseSession,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: black),
                  ),
                ],),
            ),
            SessionList(),
            const SizedBox(height: 2),*/
          ],
        ),
      ),
    );

  }
}
