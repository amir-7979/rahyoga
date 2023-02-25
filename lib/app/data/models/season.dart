class Season {
  Season({
    required this.id,
    required this.course,
    required this.header,
  });
  late final int id;
  late final int course;
  late final String header;

  Season.fromJson(Map<String, dynamic> json){
    id = json['id'];
    course = json['course'];
    header = json['header'];
  }

}
