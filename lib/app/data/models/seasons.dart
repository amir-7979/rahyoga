import 'all.dart';
import 'passed.dart';

class Seasons {
  Seasons({
    this.all,
    this.passed,
  });

  late  List<All>? all;
  late  List<Passed>? passed;

  Seasons.fromJson(Map<String, dynamic> json) {
    all = List.from(json['all']).map((e) => All.fromJson(e)).toList();
    passed = List.from(json['passed']).map((e) => Passed.fromJson(e)).toList();
  }

}
