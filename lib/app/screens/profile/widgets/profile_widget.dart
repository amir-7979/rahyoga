import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(14),
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
              const CircleAvatar(
                //todo change this later
                backgroundImage: NetworkImage('https://d3544la1u8djza.cloudfront.net/APHI/Blog/2016/10_October/persians/Persian+Cat+Facts+History+Personality+and+Care+_+ASPCA+Pet+Health+Insurance+_+white+Persian+cat+resting+on+a+brown+sofa-min.jpg'),
                radius: 45,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                child: Column(
                children: [
                  Text(
                    'آرمان سلحشور',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: black),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '09117474747',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: textGray),
                  ),
                ],
            ),
              )],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
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
                      color: grayText3),
                ),
                Text(
                  '${1} ${Translator.course.tr}',
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
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 40),
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
                      color: grayText3),
                ),
                Text(
                  '${1} ${Translator.session.tr}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                      color: black),
                )
              ],
            ),
          ),
          Text(
            Translator.progress.tr,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
                color: grayText3),
          ),
          Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20))
        ],
      ),
    );
  }
}
