import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rahyoga/app/data/models/movement.dart';
import 'package:rahyoga/app/screens/blog/blog_controller.dart';
import '../../../../core/theme/colors.dart';
import '../../../widgets/shimmer_screen.dart';
import 'movment_item.dart';

class MovementList extends GetWidget<BlogController> {
  const MovementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedGridView(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      pagingController: controller.pagingController1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 156 / 180),
      builderDelegate: PagedChildBuilderDelegate<Movement>(
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
        itemBuilder: (context, item, index) => Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: MovementItem(item),
        ),
      ),

    );
  }

}
