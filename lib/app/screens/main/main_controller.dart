import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainController extends GetxController{
  final PersistentTabController tabController = PersistentTabController(initialIndex: 0);

  void setTab(int i){
    tabController.jumpToTab(i);
    update();
  }

}
