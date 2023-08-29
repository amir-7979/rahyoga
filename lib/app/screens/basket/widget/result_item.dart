import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/languages/translator.dart';
import '../../../../core/theme/colors.dart';
import '../../../data/models/result.dart';
import '../../../widgets/cache_image.dart';
import '../basket_controller.dart';

class ResultItem extends GetView<BasketController> {
  ResultItem(this.result, {super.key});

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75,
          child: InkWell(
            onTap: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                  width: 90,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CacheImage(url: result.image ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: InkWell(
                            onTap: (){
                              controller.deleteItemFromBasket(result.id??0);
                            },
                            child: Obx(
                              ()=> Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white
                                ),
                                child: (controller.isLoading.value == result.id)
                                    ? const CircularProgressIndicator(
                                  color: primaryColor,
                                  strokeWidth: 2,
                                )
                                    : Transform.scale(
                                    scale: 0.7,
                                    child: SvgPicture.asset('assets/images/basket/delete.svg')),
                              ),
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 3, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.header ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: black,
                                  overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${Translator.mentor.tr} : ${result.mentor!.fullname ?? ''}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                  color: textGray,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            (result.offerPercent == 0)
                                ? Text(
                              Translator.toman
                                  .trParams({'number': result.offer.toString()}),
                              style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: black,
                              ),
                            )
                                : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  Translator.toman.trParams(
                                      {'number': result.price??''}),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                    color: profileGray,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  Translator.toman.trParams(
                                      {'number': result.offer??''}),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                    color: black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(height: 1),
        const SizedBox(height: 5),
      ],
    );
  }
}
