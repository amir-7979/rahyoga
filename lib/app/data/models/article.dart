import 'author.dart';

class Article {
  Article({
    this.id,
    this.header,
    this.author,
    this.subject,
    this.image,
    this.dateModified,
    this.datePublished,
    this.description,
    this.datePublishedUnix,
    this.dateModifiedUnix,
    this.liked,
  });

  late final int? id;
  late final String? header;
  late final Author? author;
  late final String? subject;
  late final String? image;
  late final String? dateModified;
  late final String? datePublished;
  late String? description;
  late final int? datePublishedUnix;
  late final int? dateModifiedUnix;
  late bool? liked;

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    author = Author.fromJson(json['author']);
    subject = json['subject'];
    image = json['image'];
    dateModified = json['date_modified'];
    description = json['description'];
    final imgRegex = RegExp(r'<img(.*?)>');

    // Replace all img tags with modified versions that include the centering style
    final modifiedHtml = description!.replaceAllMapped(
      imgRegex,
          (match) => '<div style="text-align: center">${match.group(0)}</div>',
    );
    description = modifiedHtml;
    datePublished = json['date_published'];
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
    liked = json['liked'];
  }
}
