class Season {
  Season({
    required this.id,
    required this.course,
    required this.order,
    required this.orderPersian,
    required this.header,
  });
  late final int id;
  late final int course;
  late final int order;
  late final String orderPersian;
  late final String header;

  Season.fromJson(Map<String, dynamic> json){
    id = json['id'];
    course = json['course'];
    order = json['order'];
    orderPersian = json['order_persian'];
    header = json['header'];
  }
}
