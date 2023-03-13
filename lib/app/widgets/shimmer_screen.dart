import 'package:flutter/material.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'package:rahyoga/core/values/consts.dart';
import 'package:shimmer/shimmer.dart';

class SimmerScreen extends StatelessWidget {
  const SimmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: secondaryColor,
      highlightColor: tertiaryColor,
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Text('shimmer'),
      ),
    );

  }
}
