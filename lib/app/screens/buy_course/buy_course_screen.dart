import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/widgets/video_player.dart';
import 'package:readmore/readmore.dart';

import '../../../core/theme/colors.dart';
import '../../../core/values/consts.dart';
import 'buy_course_controller.dart';
import 'widgets/course_list.dart';

class BuyCourseScreen extends StatelessWidget {
  BuyCourseScreen({Key? key}) : super(key: key);
  final BuyCourseController _ctrl = Get.find<BuyCourseController>();

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
            _ctrl.courseDetail,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 15),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/star.svg'),
                  const SizedBox(width: 4),
                  Text(
                    _ctrl.save,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: black,
                    ),
                  ),
                ],
              ),
            ),],
        ),
        bottomNavigationBar: SizedBox(
          height:80,
          child: Container(
            decoration: const BoxDecoration(
              color: favoriteGray2,
              borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(20),),
            ),
            child: SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromWidth(200),
                        backgroundColor: primaryColor,
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
                    ),
                  ),
                  const SizedBox(width: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_ctrl.cost, style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: textGray)),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('1234000', style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: black)),
                          Text(_ctrl.toman2, style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: black)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),),
          ),
        ),
        body: ListView(
          children: [
            const VideoPlayer(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    color: secondaryColor,
                    borderRadius: BorderRadiusDirectional.all(Radius.circular(12))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         const CircleAvatar(
                          //todo change this later
                          backgroundImage: NetworkImage('https://ddd3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg'),
                          radius: 24,
                        ),
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
            CourseList(),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );

  }
}
