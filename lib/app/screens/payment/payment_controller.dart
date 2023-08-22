import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/seller.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentController extends GetxController {
  late Seller seller;
  String price = '';

  @override
  void onInit() {
    seller = Get.arguments[0];
    price = Get.arguments[1];
    super.onInit();
  }

  Future<void> lunchTelegram() async {
    Uri _url = Uri.parse(seller.telegramID);
    try{
      await launchUrl(_url);
    } catch(err){
      print(err.toString());
    }
  }

  void back() => Get.back();


}
