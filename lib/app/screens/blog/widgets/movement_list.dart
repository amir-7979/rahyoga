import 'package:flutter/widgets.dart';
import 'package:rahyoga/core/values/consts.dart';

import '../../../../core/theme/colors.dart';
import 'movment_item.dart';

class MovementList extends StatelessWidget {
   MovementList({Key? key}) : super(key: key);
  var items = [1,1,1,1,1,1];

  @override
  Widget build(BuildContext context) {
      return GridView.builder(
        cacheExtent: 500,
        padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 10, 10),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.84),
        itemCount: items.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: screenWidth,
                child: MovementItem()),
          );
        },
      );
  }
}
