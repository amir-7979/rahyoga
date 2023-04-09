import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rahyoga/app/widgets/cache_image.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/models/profile.dart';

class ProfileWidget extends StatelessWidget {
   ProfileWidget(this.profile, {super.key});
  Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(14),
      decoration: const BoxDecoration(
          color: fourthColor,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(12))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //CacheImage(url: profile.image??'', imageBuilder: true),
              CacheImage(url: profile.image??'', imageBuilder: true, height: 72),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    profile.firstName??profile.username!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    profile.phoneNumber??profile.email!,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: textGray),
                  ),
                ],
            ),
              ),],
          ),
          const Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 20),
            child: DottedLine(dashLength: 9,
                dashGapLength: 9,
                lineThickness: 1,
              dashColor: profilePurple2,),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Translator.boughtCourseCount.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                      color: textGray),
                ),
                Text(
                  '${profile.courses} ${Translator.course.tr}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                      color: black),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Translator.watchedCoursesCount.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                      color: textGray),
                ),
                Text(
                  '${profile.watched} ${Translator.session.tr}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                      color: black),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Translator.progress.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    color: textGray),
              ),
              Container(
                child: CircularPercentIndicator(
                  radius:30,
                  lineWidth: 4.0,
                  percent: profile.progress??0.0,
                  center: Text(
                    '${profile.progress.toString().substring(2)}%'
                        '',
                    style: Get.theme
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: primaryColor),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
