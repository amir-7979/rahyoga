import 'package:get/get.dart';

class Seller {
  Seller({
    required this.telegramID,
    required this.phone,
    required this.bankAccountNumber,
  });
  late final String telegramID;
  late final String phone;
  late final String bankAccountNumber;

  Seller.fromJson(Map<String, dynamic> json){
    telegramID =json['telegramID'];
    phone = json['phone'];
    bankAccountNumber = json['bankAccountNumber'];
  }

}