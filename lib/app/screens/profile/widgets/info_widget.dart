import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/profile/profile_controller.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/models/profile.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget(this.profile, {Key? key}) : super(key: key);
  Profile profile;
  final ProfileController _controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 15),
        decoration: BoxDecoration(
            borderRadius: const BorderRadiusDirectional.all(Radius.circular(12)),
          border: Border.all(color: moreTextColor),
    ),
      child: Column(
        children: [
        /*  InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/profile/bag.svg'),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        Translator.orders.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            color: textGray),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(end: 10),
                  child: Icon(Icons.keyboard_arrow_left, color: profileGray,),
                ),

              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(35, 8, 0, 10),
            child: Divider(),
          ),
*/
          InkWell(
            onTap: () => _controller.gotoBookmark(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/profile/bookmark2.svg'),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        Translator.bookmarks.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            color: textGray),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(end: 10),
                  child: Icon(Icons.keyboard_arrow_left, color: profileGray,),
                ),

              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(35, 8, 0, 10),
            child: Divider(
              color: tertiaryColor2,
            ),
          ),

         /* InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/profile/logo2.svg'),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        Translator.aboutUs.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            color: textGray),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(end: 10),
                  child: Icon(Icons.keyboard_arrow_left, color: profileGray,),
                ),

              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(35, 8, 0, 10),
            child: Divider(),
          ),*/
          InkWell(
            onTap: () {
              _controller.exit();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/profile/logout.svg'),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        Translator.exit.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            color: redError),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(end: 10),
                  child: Icon(Icons.keyboard_arrow_left, color: profileGray,),
                ),
              ],
            ),
          ),

          SizedBox(height: 5)
        ],
      ),
    );
  }
}
