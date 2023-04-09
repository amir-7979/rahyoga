import 'author.dart';

class LikedBlog {
  LikedBlog({
     this.id,
     this.date,
     this.dateUnix,
     this.header,
     this.subject,
     this.image,
     this.author,
     this.liked,
     this.user,
     this.article,
  });
  late final int? id;
  late final String? date;
  late final int? dateUnix;
  late final String? header;
  late final String? subject;
  late final String? image;
  late final Author? author;
  late bool? liked;
  late final int? user;
  late final int? article;

  LikedBlog.fromJson(Map<String?, dynamic> json){
    id = int.parse(json['id']);
    date = json['date'];
    dateUnix = json['date_unix'];
    header = json['header'];
    subject = json['subject'];
    image = json['image'];
    author = Author.fromJson(json['author']);
    liked = json['liked'];
    user = json['user'];
    article = json['article'];
  }
}
