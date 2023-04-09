import 'category.dart';
import 'mentor.dart';
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
  late  int? totalPrice=0;
  late  int? totalOffer=0;
  late  int? difference=0;

  Basket.fromJson(Map<String?, dynamic> json){
    count = json['count'];
    next = null;
    previous = null;
    results = List.from(json['results']).map((e)=>Result.fromJson(e)).toList();
    totalPrice = json['total_price']??0;
    totalOffer = json['total_offer']??0;
    difference = json['difference']??0;
  }
}


