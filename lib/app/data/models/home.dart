import 'course.dart';
import 'last_course.dart';
import 'movement.dart';

class Home {
  Home({
     this.lastCourse,
     this.courses,
     this.movements,
     this.miniCourses,
     this.paid,
    this.courseCartCounter
  });
  LastCourse? lastCourse;
  List<Course>? courses;
  List<Movement>? movements;
  List<Course>? miniCourses;
  List<Course>? paid;
  int? courseCartCounter = 0;


  Home.fromJson(Map<String, dynamic> json){
    lastCourse = (json['last_course'] != null)
        ? LastCourse.fromJson(json['last_course'])
        : null;
    courses = (json['courses'] != []) ? List.from(json['courses']).map((e)=>Course.fromJson(e)).toList(): null;
    movements = (json['movements'] != []) ? List.from(json['movements']).map((e)=>Movement.fromJson(e)).toList(): null;
    miniCourses = (json['mini_courses'] != []) ? List.from(json['mini_courses']).map((e)=>Course.fromJson(e)).toList(): null;
    paid = (json['paid'] != []) ? List.from(json['paid']).map((e)=>Course.fromJson(e)).toList() : null;
    courseCartCounter = json['course_cart_counter'];
  }
}













