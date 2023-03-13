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
  late final List<LikedCourse>? likedCourses;
  late final int? total;

  LikedCourses.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = null;
    previous = null;
    likedCourses = json['liked_courses'] != null ? List.from(json['liked_courses']).map((e)=>LikedCourse.fromJson(e)).toList() : List.from(json['courses']).map((e)=>LikedCourse.fromJson(e)).toList();
    total = json['total'];
  }
}
