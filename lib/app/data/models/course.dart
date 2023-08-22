import 'package:intl/intl.dart';

import 'category.dart';
import 'mentor.dart';
import 'seasons.dart';

class Course {
  Course({
     this.id,
     this.header,
     this.image,
     this.category,
     this.mentor,
     this.time,
     this.price,
    this.offer,
    this.offer_percent,
     this.theNumberOfSeasons,
     this.theNumberOfSeasonsPersian,
     this.dateModified,
     this.datePublished,
     this.datePublishedUnix,
     this.dateModifiedUnix,
    this.progress,
    this.seasons,


  });
  late final int? id;
  late final String? header;
  late final String? image;
  late final Category? category;
  late final Mentor? mentor;
  late final double? time;
  late final String? price;
  late final int?  offer_percent;
  late final String? offer;
  late final int? theNumberOfSeasons;
  late final String? theNumberOfSeasonsPersian;
  late final String? dateModified;
  late final String? datePublished;
  late final int? datePublishedUnix;
  late final int? dateModifiedUnix;
  late final Seasons? seasons;
  late final double? progress;


  Course.fromJson(Map<String, dynamic> json){
    id = json['id'];
    header = json['header'];
    image = json['image'];
    category = Category.fromJson(json['category']);
    mentor = Mentor.fromJson(json['mentor']);
    time = double.parse(json['time']);
    price = NumberFormat('#,###.##').format(json['price']);
    offer = NumberFormat('#,###.##').format(json['_offer']);
    offer_percent = json['_offer_percent']??0;
    theNumberOfSeasons = json['the_number_of_sessions'];
    theNumberOfSeasonsPersian = json['the_number_of_seasons_persian'];
    dateModified = json['date_modified'];
    datePublished = json['date_published'];
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
    progress = (json['progress'] != null) ? json['progress'].toDouble() : null;
    seasons = (json['seasons'] != null) ? Seasons.fromJson(json['seasons']) : null;
  }

}
