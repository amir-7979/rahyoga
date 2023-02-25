import 'package:rahyoga/app/data/models/progress.dart';
import 'package:rahyoga/app/data/models/season.dart';

import 'course_item.dart';

class LastCourse {
  LastCourse({
    required this.course,
    required this.season,
    required this.progres,
  });
  late final Course course;
  late final Season season;
  late final Progres progres;

  LastCourse.fromJson(Map<String, dynamic> json){
    course = Course.fromJson(json['course']);
    season = Season.fromJson(json['season']);
    progres = Progres.fromJson(json['progres']);
  }
}
