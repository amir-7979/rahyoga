import 'package:rahyoga/app/data/models/season.dart';

import 'course.dart';

class LastCourse {
  LastCourse({
     this.course,
     this.season,
     this.progress,
  });
  late final Course? course;
  late final Season? season;
  late final double? progress;

  LastCourse.fromJson(Map<String, dynamic> json){
    course = Course.fromJson(json['course']);
    season = Season.fromJson(json['season']);
    progress = json['progress'];
  }
}
