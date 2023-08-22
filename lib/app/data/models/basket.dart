import 'package:intl/intl.dart';
import 'package:rahyoga/app/data/models/seller.dart';

import 'result.dart';

class Basket {
  Basket({
     this.count,
    this.next,
    this.previous,
     this.results,
     this.totalPrice,
     this.totalOffer,
     this.difference,
  });
  late  int? count;
  late  String? next;
  late  String? previous;
  late  List<Result>? results = [];
  late  String? totalPrice;
  late  String? totalOffer;
  late  String? difference;
  late final Seller seller;


  Basket.fromJson(Map<String?, dynamic> json){
    count = json['count'];
    next = null;
    previous = null;
    results = List.from(json['results']).map((e)=>Result.fromJson(e)).toList();
    totalPrice = NumberFormat('#,###.##').format(json['total_price']??0);
    totalOffer = NumberFormat('#,###.##').format(json['total_offer']??0);
    difference = NumberFormat('#,###.##').format(json['difference']??0);
    seller = Seller.fromJson(json['seller']);

  }
}


