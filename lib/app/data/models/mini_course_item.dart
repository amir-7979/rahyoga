import 'category.dart';
import 'mentor.dart';

class MiniCourses {
  MiniCourses({
    required this.id,
    required this.header,
    required this.image,
    required this.category,
    required this.mentor,
    required this.time,
    required this.price,
    required this.offer,
    required this.dateModified,
    required this.datePublished,
    required this.datePublishedUnix,
    required this.dateModifiedUnix,
  });
  late final int id;
  late final String header;
  late final String image;
  late final Category category;
  late final Mentor mentor;
  late final int time;
  late final int price;
  late final int offer;
  late final String dateModified;
  late final String datePublished;
  late final int datePublishedUnix;
  late final int dateModifiedUnix;

  MiniCourses.fromJson(Map<String, dynamic> json){
    id = json['id'];
    header = json['header'];
    image = '';
    category = Category.fromJson(json['category']);
    mentor = Mentor.fromJson(json['mentor']);
    time = json['time'];
    price = json['price'];
    offer = json['_offer'];
    dateModified = json['date_modified'];
    datePublished = json['date_published'];
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
  }
}