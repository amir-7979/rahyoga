import 'like_blog.dart';

class LikedBlogs {
  LikedBlogs({
     this.count,
    this.next,
    this.previous,
     this.likedArticles,
     this.total,
  });
  late final int? count;
  late final String? next;
  late final String? previous;
  late final List<LikedBlog>? likedArticles;
  late final int? total;

  LikedBlogs.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    likedArticles = List.from(json['liked_articles']).map((e)=>LikedBlog.fromJson(e)).toList();
    total = json['total'];
  }
}


