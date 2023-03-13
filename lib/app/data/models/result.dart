import 'category.dart';
import 'mentor.dart';

class Result {
  Result({
    this.id,
    this.user,
    this.course,
    this.header,
    this.category,
    this.theNumberOfSeasons,
    this.theNumberOfSeasonsPersian,
    this.price,
    this.offer,
    this.offerPercent,
    this.mentor,
    this.date,
    this.durationPersian,
    this.image,
  });
  late final int? id;
  late final int? user;
  late final int? course;
  late final String? header;
  late final Category? category;
  late final int? theNumberOfSeasons;
  late final String? theNumberOfSeasonsPersian;
  late final int? price;
  late final int? offer;
  late final int? offerPercent;
  late final Mentor? mentor;
  late final String? date;
  late final String? durationPersian;
  late final String? image;

  Result.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    user = json['user'];
    course = json['course'];
    header = json['header'];
    category = Category.fromJson(json['category']);
    theNumberOfSeasons = json['the_number_of_seasons'];
    theNumberOfSeasonsPersian = json['the_number_of_seasons_persian'];
    price = json['price'];
    offer = json['_offer'];
    offerPercent = json['_offer_percent'];
    mentor = Mentor.fromJson(json['mentor']);
    date = json['date'];
    durationPersian = json['duration_persian'];
    image = json['image'];
  }
}
