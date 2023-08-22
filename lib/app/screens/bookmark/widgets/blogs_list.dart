import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rahyoga/app/screens/bookmark/bookmark_controller.dart';
import 'package:rahyoga/core/theme/colors.dart';

import '../../../widgets/shimmer_screen.dart';
import 'blogs_item.dart';

class BlogList extends GetWidget<BookmarkController> {
  const BlogList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookmarkController>(
        init: controller, builder: (context) => blogs());
  }

  Widget blogs() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
      child: PagedListView.separated(
        separatorBuilder: (context, item) => const Padding(
          padding: EdgeInsetsDirectional.symmetric(vertical: 5),
          child: Divider(),
        ),
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
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
          firstPageErrorIndicatorBuilder: (_) =>Center(
            child: Text('error', style: Get.theme
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
