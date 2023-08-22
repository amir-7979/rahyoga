import 'package:get/get.dart';

import 'liked_course.dart';

class LikedCourses {
  LikedCourses({
     this.count,
    this.next,
    this.previous,
     this.likedCourses,
     this.total,
  });
  late final int? count;
  late final String? next;
  late final String? previous;
  late List<LikedCourse>? likedCourses = [];
  late final int? total;

  LikedCourses.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
   likedCourses = (json['liked_courses'] != null ? List.from(json['liked_courses']).map((e)=>LikedCourse.fromJson(e)).toList() : json['courses'] == null ? List.from(json['mini_courses']).map((e)=>LikedCourse.fromJson(e)).toList() : List.from( json['courses']
        .where((e) => e['owner'] == false)
        .map((e) => LikedCourse.fromJson(e))
        ?? []));
    total = json['total'];
  }
}
