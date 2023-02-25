import 'type.dart';
class Category {
  Category({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
  });
  late final int id;
  late final String name;
  late final Type type;
  late final String description;

  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    type = Type.fromJson(json['type']);
    description = json['description'];
  }
}
