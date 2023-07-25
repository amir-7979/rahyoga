import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../widgets/shimmer_screen.dart';
import 'download_controller.dart';
import 'widgets/downloaded_list.dart';


class HomeScreen extends GetWidget<DownloadController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: controller.back,
          color: black,
        ),
        title: Text(
          controller.downloaded,
          style:
          Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
        ),
      ),
      body:GetBuilder<DownloadController>(
          init: controller,
          builder: (context) => context.movies.isEmpty
              ? const SimmerScreen()
              : DownloadedList(controller.movies)
      ),
    );
  }

}


