import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../widgets/cache_image.dart';

class MovementItem extends StatelessWidget {
  const MovementItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: generalItemBorderGray),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: const AspectRatio(
                    aspectRatio: 1.1/1,
                    child: CacheImage(
                    url:
                    'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/03/Ashtanga-Yoga.jpeg'),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                      child: Text(
                        'حرکت فلان',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: black),
                      ),
                    ),
                  ],
                ),
              ),],
          ),
        ),
    );
  }
}
