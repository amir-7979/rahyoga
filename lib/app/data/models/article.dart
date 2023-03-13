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
  late final String? description;
  late final int? datePublishedUnix;
  late final int? dateModifiedUnix;
  late final bool? liked;

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    author = Author.fromJson(json['author']);
    subject = json['subject'];
    image = json['image'];
    dateModified = json['date_modified'];
    datePublished = json['date_published'];
    description = ''''
                     
<!DOCTYPE html>
<html lang="en">
  <!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <!-- STYLES -->
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
  </head>
    <body>
        <div class="ql-editor" data-gramm="false" contenteditable="false">
            ${json['description']}
        </div>

    </body>
</html>

''';
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
    liked = json['liked'];
  }
}
