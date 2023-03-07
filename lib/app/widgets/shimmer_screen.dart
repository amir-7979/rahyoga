import 'package:flutter/material.dart';
import 'package:rahyoga/core/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class SimmerScreen extends StatelessWidget {
  const SimmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: secondaryColor,
        highlightColor: tertiaryColor,
        child: Container(),
      ),
    );

  }
}
