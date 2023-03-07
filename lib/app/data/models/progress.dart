import 'course.dart';

class Progres {
  Progres({
    required this.course,
    required this.progress,
  });
  late final Course course;
  late final int progress;

  Progres.fromJson(Map<String, dynamic> json){
    course = Course.fromJson(json['course']);
    progress = json['progress'];
  }

}
