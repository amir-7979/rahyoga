
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/blogs.dart';
import '../../../widgets/shimmer_screen.dart';
import '../blog_controller.dart';
import 'blogs_item.dart';

class BlogList extends GetWidget<BlogController> {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.fetchBlogs(),
        builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData) ? blogs(controller.blogs.value) :  const SimmerScreen());

  }

  Widget blogs(Blogs? blogs) {
    return blogs == null || blogs.articles == null?  Container() : Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: ListView.separated(
        separatorBuilder: (BuildContext ctx, index) => const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: Divider(height: 1),
        ),
        itemCount: blogs.articles!.length,
        itemBuilder: (BuildContext ctx, index) {
          return BlogItem(blogs.articles![index]);

        },

      ),
    );
  }
}
