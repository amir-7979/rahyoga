import 'package:flutter/material.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/theme/colors.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: screenWidth,
      color: primaryColor,
    );
  }
}
