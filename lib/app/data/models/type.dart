class Type {
  Type({
    required this.id,
    required this.name,
    required this.description,
  });
  late final int id;
  late final String name;
  late final String description;

  Type.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

}
