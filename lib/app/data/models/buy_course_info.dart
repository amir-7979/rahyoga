import 'package:intl/intl.dart';

import 'category.dart';
import 'mentor.dart';
import 'paid_course_info.dart';

class BuyCourseInfo {
  BuyCourseInfo({
    this.id,
    this.header,
    this.image,
    this.category,
    this.preview,
    this.mentor,
    this.description,
    this.requirements,
    this.durationPersian,
    this.price,
    this.offer,
    this.offerPercent,
    this.theNumberOfSeasons,
    this.theNumberOfSeasonsPersian,
    this.dateModified,
    this.datePublished,
    this.datePublishedUnix,
    this.dateModifiedUnix,
    this.owner,
    this.progress,
    this.liked,
  });
  late final int? id;
  late final String? header;
  late final String? image;
  late final Category? category;
  late final String? preview;
  late final Mentor? mentor;
  late final String? description;
  late final String? requirements;
  late final String? durationPersian;
  late final String? price;
  late final String? offer;
  late final int? offerPercent;
  late final int? theNumberOfSeasons;
  late final String? theNumberOfSeasonsPersian;
  late final String? dateModified;
  late final String? datePublished;
  late final int? datePublishedUnix;
  late final int? dateModifiedUnix;
  late final bool? owner;
  late final Progress? progress;
  late bool? liked;

  BuyCourseInfo.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    header = json['header'];
    image = json['image'];
    category = Category.fromJson(json['category']);
    preview = json['preview'];
    mentor = Mentor.fromJson(json['mentor']);
    description = json['description'];
    requirements = json['requirements'];
    durationPersian = json['duration_persian'];
    price = NumberFormat('#,###.##').format(json['price']);
    offer = NumberFormat('#,###.##').format(json['_offer']);
    offerPercent = json['_offer_percent'];
    theNumberOfSeasons = json['the_number_of_seasons'];
    theNumberOfSeasonsPersian = json['the_number_of_seasons_persian'];
    dateModified = json['date_modified'];
    datePublished = json['date_published'];
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
    owner = json['owner'];
    progress = Progress.fromJson(json['progress']);
    liked = json['liked'];
  }
}
