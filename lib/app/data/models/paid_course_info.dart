import 'category.dart';
import 'mentor.dart';
import 'seasons.dart';

class PaidCourseInfo {
  PaidCourseInfo({
     this.id,
     this.header,
     this.image,
     this.category,
     this.preview,
     this.mentor,
     this.description,
     this.requirements,
     this.time,
     this.durationPersian,
     this.price,
     this.offer,
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
  late final double? time;
  late final String? durationPersian;
  late final int? price;
  late final int? offer;
  late final int? theNumberOfSeasons;
  late final String? theNumberOfSeasonsPersian;
  late final String? dateModified;
  late final String? datePublished;
  late final int? datePublishedUnix;
  late final int? dateModifiedUnix;
  late final bool? owner;
  late final Progress? progress;
  late final bool? liked;

  PaidCourseInfo.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    header = json['header'];
    image = json['image'];
    category = Category.fromJson(json['category']);
    preview = json['preview'];
    mentor = Mentor.fromJson(json['mentor']);
    description = json['description'];
    requirements = json['requirements'];
    time = double.parse(json['time']);
    durationPersian = json['duration_persian'];
    price = json['price'];
    offer = json['_offer'];
    theNumberOfSeasons = json['the_number_of_seasons']??0;
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
class Progress {
  Progress({
    required this.seasons,
    required this.progress,
  });
  late  Seasons seasons;
  late final double progress;

  Progress.fromJson(Map<String, dynamic> json){
    seasons = Seasons.fromJson(json['seasons']);
    progress = json['progress'];
  }
}