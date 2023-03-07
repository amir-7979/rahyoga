import 'last_course.dart';
import 'mini_course.dart';
import 'movement.dart';
import 'course.dart';

class Home {
  Home({
    required this.lastCourse,
    required this.courses,
    required this.movements,
    required this.miniCourses,
  });
  late final LastCourse lastCourse;
  late final List<Course> courses;
  late final List<Movements> movements;
  late final List<MiniCourses> miniCourses;

  Home.fromJson(Map<String, dynamic> json){
    lastCourse = LastCourse.fromJson(json['last_course']);
    courses = List.from(json['courses']).map((e)=>Course.fromJson(e)).toList();
    movements = List.from(json['movements']).map((e)=>Movements.fromJson(e)).toList();
    miniCourses = List.from(json['mini_courses']).map((e)=>MiniCourses.fromJson(e)).toList();
  }
}













