class Blog {
  Blog({
     this.id,
     this.header,
    //required this.author,
     this.subject,
     this.image,
     this.dateModified,
     this.datePublished,
     this.datePublishedUnix,
     this.dateModifiedUnix,
  });

  late final int? id;
  late final String? header;
  //late final Author author;
  late final String? subject;
  late final String? image;
  late final String? dateModified;
  late final String? datePublished;
  late final int? datePublishedUnix;
  late final int? dateModifiedUnix;

  Blog.fromJson(Map<String, dynamic> json){
    id = json['id'];
    header = json['header'];
    //author = Author.fromJson(json['author']);
    subject = json['subject'];
    image = json['image'];
    dateModified = json['date_modified'];
    datePublished = json['date_published'];
    datePublishedUnix = json['date_published_unix'];
    dateModifiedUnix = json['date_modified_unix'];
  }
}