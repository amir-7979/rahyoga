import 'author.dart';

class Movements {
  Movements({
    required this.id,
    required this.header,
    required this.author,
    required this.image,
    required this.dateModified,
    required this.datePublished,
    required this.datePublishedUnix,
    required this.dateModifiedUnix,
  });
  late final int id;
  late final String header;
  late final Author author;
  late final String image;
  late final String dateModified;
  late final String datePublished;
  late final int datePublishedUnix;
  late final int dateModifiedUnix;

  Movements.fromJson(Map<String, dynamic> json){
    id = json['id'];
    header = json['header'];
    author = Author.fromJson(json['author']);
    image = json['image'];
    dateModified = json['date_modified'];
    datePublished = json['date_published'];
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
  }

}
