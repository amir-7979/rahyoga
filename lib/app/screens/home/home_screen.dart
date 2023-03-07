import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/languages/translator.dart';
import '../../../core/theme/colors.dart';
import '../../data/models/home.dart';
import '../../data/services/content_api_services.dart';
import '../../widgets/shimmer_screen.dart';
import 'home_controller.dart';
import 'widgets/general_course_list.dart';
import 'widgets/last_course_item.dart';
import 'widgets/movements_slider.dart';
import 'widgets/mini_course_list.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final HomeController _controller = Get.find<HomeController>();
   final ContentApiService _apiService = Get.find<ContentApiService>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          Translator.app_name.tr,
          style:
              Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //todo search
            },
            icon: SvgPicture.asset('assets/images/search.svg'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: IconButton(
              onPressed: () {
                _controller.gotoBasketScreen();
              },
              icon: SvgPicture.asset('assets/images/basket.svg'),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _apiService.home(),
          builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData) ? home(snapshot.data) :  const SimmerScreen()),
    );
  }

  Widget home(Home home){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
      child: ListView(
        children: [
          LastCourseItem(home.lastCourse),
          const SizedBox(height: 25),
          /*const GeneralCourseList(home.lastCourse),
          const SizedBox(height: 25),
          MovementsSlider(home.movements),
          const SizedBox(height: 25),
          const MiniCourseList(home.miniCourses),
          const SizedBox(height: 5),*/
        ],
      ),
    );
  }
}
