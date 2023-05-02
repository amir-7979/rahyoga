import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/colors.dart';

class ShimmerProgressBar extends StatelessWidget {
  ShimmerProgressBar(this.progress);

  double progress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 7,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: progressBackgroundColor),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Shimmer.fromColors(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: primaryColor),
                  ),
                  period: Duration(milliseconds: 2500),
                  baseColor: primaryColor,
                  highlightColor: shimmerGreen),
            )
          ],
        ),
      ),
    );
  }
}
