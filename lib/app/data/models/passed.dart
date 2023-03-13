class Passed {
  Passed({
     this.id,
    this.user,
     this.course,
     this.header,
     this.orderPersian,
  });
  late final int? id;
  late final int? user;
  late final int? course;
  late final String? header;
  late final String? orderPersian;

  Passed.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = json['user'];
    course = json['course'];
    header = json['header'];
    orderPersian = json['order_persian'];
  }
}