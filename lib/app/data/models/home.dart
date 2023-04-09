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
  late LastCourse? lastCourse;
  late List<Course>? courses=[];
  late List<Movement>? movements=[];
  late List<Course>? miniCourses=[];
  late List<Course>? paid=[];


  Home.fromJson(Map<String, dynamic> json){
    lastCourse = LastCourse.fromJson(json['last_course']);
    courses = List.from(json['courses']).map((e)=>Course.fromJson(e)).toList();
    movements = List.from(json['movements']).map((e)=>Movement.fromJson(e)).toList();
    miniCourses = List.from(json['mini_courses']).map((e)=>Course.fromJson(e)).toList();
    paid = List.from(json['paid']).map((e)=>Course.fromJson(e)).toList();
  }
}













