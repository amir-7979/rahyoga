import 'course.dart';

class Paid {
  Paid({
    this.next,
    this.courses,
     this.total,
  });
  late final List<Course>? courses;
  late final int? total;
  late final String? next;

  Paid.fromJson(Map<String, dynamic> json){
    courses = List.from(json['courses']).map((e)=>Course.fromJson(e)).toList();
    total = json['total'];
    next = json['next'];

  }

}


