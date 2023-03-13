import 'course.dart';
import 'user.dart';

class Paid {
  Paid({
     this.user,
     this.courses,
     this.total,
  });
  late final User? user;
  late final List<Course>? courses;
  late final int? total;

  Paid.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    courses = List.from(json['courses']).map((e)=>Course.fromJson(e)).toList();
    total = json['total'];
  }

}


