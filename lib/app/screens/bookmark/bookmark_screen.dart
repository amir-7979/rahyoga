import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/screens/bookmark/bookmark_controller.dart';

import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import 'widgets/blogs_list.dart';

class BookmarkScreen extends GetView<BookmarkController> {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
            elevation: 0.5,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.black,
            leading: BackButton(
              onPressed: controller.back,
              color: black,
            ),
            title: Text(
              Translator.saveStaff.tr,
              style: Get.theme
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: black),
            )
        ),
        body: BlogList(),
      ),

    );
  }

}
