import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/colors.dart';
import '../download_controller.dart';

class DownloadedItem extends GetWidget<DownloadController> {
  DownloadedItem(this.movie, this.index);

  Map<String, dynamic> movie;
  int index;

  @override
  Widget build(BuildContext context) {
    return movie.isEmpty
        ? Container()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    movie['name'] ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                        color: black,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    '${movie['session']} جلسه ' ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                        color: black,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  controller.deleteVideoFile(movie['course'], movie['session']);
                },
                child: Obx(
                  () => Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: white),
                    child: (controller.isLoading.value == index)
                        ? const CircularProgressIndicator(
                            color: primaryColor,
                            strokeWidth: 2,
                          )
                        : Transform.scale(
                            scale: 0.7,
                            child: SvgPicture.asset(
                                'assets/images/basket/delete.svg')),
                  ),
                ),
              ),
            ],
          );
  }
}
