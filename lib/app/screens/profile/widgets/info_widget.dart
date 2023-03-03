import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

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
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/nav.svg'),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10),
                      child: Text(
                        Translator.addresses.tr,
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

          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/bag.svg'),
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

          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/bookmark2.svg'),
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
            child: Divider(),
          ),

          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/logo2.svg'),
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
          ),

          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/logout.svg'),
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
