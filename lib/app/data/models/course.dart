import 'category.dart';
import 'mentor.dart';

class Course {
  Course({
    required this.id,
    required this.header,
    required this.image,
    required this.category,
    required this.mentor,
    required this.time,
    required this.price,
    required this.offer,
    required this.theNumberOfSeasons,
    required this.theNumberOfSeasonsPersian,
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
  late final double time;
  late final int price;
  late final int offer;
  late final int theNumberOfSeasons;
  late final String theNumberOfSeasonsPersian;
  late final String dateModified;
  late final String datePublished;
  late final int datePublishedUnix;
  late final int dateModifiedUnix;

  Course.fromJson(Map<String, dynamic> json){
    id = json['id'];
    header = json['header'];
    image = json['image'];
    category = Category.fromJson(json['category']);
    mentor = Mentor.fromJson(json['mentor']);
    time = json['time'];
    price = json['price'];
    offer = json['_offer'];
    theNumberOfSeasons = json['the_number_of_seasons'];
    theNumberOfSeasonsPersian = json['the_number_of_seasons_persian'];
    dateModified = json['date_modified'];
    datePublished = json['date_published'];
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
  }

}
