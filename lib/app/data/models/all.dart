class All {
  All({
    this.id,
    this.course,
    this.durationPersian,
    this.order,
    this.orderPersian,
    this.header,
    this.description,
    this.hls,
    this.passed
  });
  late final int? id;
  late final int? course;
  late final String? durationPersian;
  late final int? order;
  late final String? orderPersian;
  late final String? header;
  late final String? description;
  late final String? hls;
  late bool? passed;

  All.fromJson(Map<String, dynamic> json){
    id = json['id'];
    course = json['course'];
    durationPersian = json['duration_persian'];
    order = json['order'];
    orderPersian = json['order_persian'];
    header = json['header'];
    description = json['description'];
    passed = json['passed'];
    hls = json['hls_code'];
  }

}