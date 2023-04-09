import 'blog.dart';

class Blogs {
  Blogs({
    this.count,
    this.next,
    this.previous,
    this.articles,
    this.total,
  });

  late final int? count;
  late final String? next;
  late final String? previous;
  late final List<Blog>? articles;
  late final int? total;

  Blogs.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    articles =List.from(json['articles']).map((e)=>Blog.fromJson(e)).toList();
    total = json['total'];
  }

}


