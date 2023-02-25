import 'package:flutter/widgets.dart';

class YogaMovmentsList extends StatelessWidget {
  const YogaMovmentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: [
        PurchasedCourseItem(),
      ],
    );
  }
}
