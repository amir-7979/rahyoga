import 'last_course.dart';
import 'movement.dart';
import 'course.dart';

class Home {
  Home({
     this.lastCourse,
     this.courses,
     this.movements,
     this.miniCourses,
     this.paid,
  });
  late final LastCourse? lastCourse;
  late final List<Course>? courses;
  late final List<Movement>? movements;
  late final List<Course>? miniCourses;
  late final List<Course>? paid;


  Home.fromJson(Map<String, dynamic> json){
    lastCourse = LastCourse.fromJson(json['last_course']);
    courses = List.from(json['courses']).map((e)=>Course.fromJson(e)).toList();
    movements = List.from(json['movements']).map((e)=>Movement.fromJson(e)).toList();
    miniCourses = List.from(json['mini_courses']).map((e)=>Course.fromJson(e)).toList();
    paid = List.from(json['paid']).map((e)=>Course.fromJson(e)).toList();
  }
}













