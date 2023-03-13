import 'course.dart';

class Progress {
  Progress({
    required this.course,
    required this.progress,
  });
  late final Course course;
  late final int progress;

  Progress.fromJson(Map<String, dynamic> json){
    course = Course.fromJson(json['course']);
    progress = json['progress'];
  }

}
