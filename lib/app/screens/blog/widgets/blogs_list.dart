import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rahyoga/app/data/models/article.dart';

import '../../../../core/theme/colors.dart';
import '../../../data/models/blog.dart';
import '../../../data/models/blogs.dart';
import '../../../widgets/shimmer_screen.dart';
import '../blog_controller.dart';
import 'blogs_item.dart';

class BlogList extends GetWidget<BlogController> {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
      child: PagedListView.separated(
        separatorBuilder: (context, item) => const Padding(
          padding: EdgeInsetsDirectional.symmetric(vertical: 5),
          child: Divider(),
        ),

        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
        pagingController: controller.pagingController2,
        builderDelegate: PagedChildBuilderDelegate<Blog>(
          firstPageProgressIndicatorBuilder: (_)=>SimmerScreen(),
          noItemsFoundIndicatorBuilder: (_) =>Center(
            child: Text('آیتمی یافت نشد', style: Get.theme
                .textTheme
                .labelMedium!
                .copyWith(
              color: primaryColor,
            ),
            ),
          ),
          newPageProgressIndicatorBuilder: (_)=>Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 10),
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: const CircularProgressIndicator(
                    color: primaryColor,
                    strokeWidth: 4,
                  ),
                ),
              ),
            ),
          ),
          itemBuilder: (context, item, index) => BlogItem(item),
        ),
      ),
    );
  }

}
