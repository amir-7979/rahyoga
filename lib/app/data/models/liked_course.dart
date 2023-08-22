import 'package:intl/intl.dart';

import 'mentor.dart';

class LikedCourse {
  LikedCourse({
     this.id,
     this.description,
     this.date,
     this.dateUnix,
     this.image,
     this.theNumberOfSeasons,
    this.price,
    this.offer,
     this.header,
     this.mentor,
     this.liked,
     this.user,
     this.course,
  });
  late final int? id;
  late final String? description;
  late final String? date;
  late final int? dateUnix;
  late final String? image;
  late final int? theNumberOfSeasons;
  late final String? price;
  late final String? offer;
  late final String? header;
  late final Mentor? mentor;
  late final bool? liked;
  late final int? user;
  late final int? course;

  LikedCourse.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    description = json['description'];
    date = json['date'];
    dateUnix = json['date_unix'];
    image = json['image'];
    price = NumberFormat('#,###.##').format(json['price']);
    offer = NumberFormat('#,###.##').format(json['_offer']);
    theNumberOfSeasons = json['the_number_of_sessions'];
    header = json['header'];
    mentor = Mentor.fromJson(json['mentor']);
    liked = json['liked'];
    user = json['user'];
    course = json['course'];
  }
}