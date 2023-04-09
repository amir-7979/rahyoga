import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/values/consts.dart';

class SimmerScreen extends StatelessWidget {
  const SimmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Card(
              elevation: 0.01,
              child: Container(),
            ),
      )

    );

  }
}
