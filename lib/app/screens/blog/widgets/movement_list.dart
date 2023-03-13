import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/models/movements.dart';
import 'package:rahyoga/app/screens/blog/blog_controller.dart';
import 'package:rahyoga/core/values/consts.dart';
import '../../../widgets/shimmer_screen.dart';
import 'movment_item.dart';

class MovementList extends GetWidget<BlogController> {
   const MovementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.fetchMovements(),
        builder: (context, AsyncSnapshot snapshot) => (snapshot.hasData) ? movements(controller.movements.value) :  const SimmerScreen());

  }

  Widget movements(Movements? movements){
      return movements == null || movements.movements == null ? Container() : GridView.builder(
        cacheExtent: 500,
        padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 10),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 156/180),
        //todo list shouldnt be null
        itemCount: movements.movements!.length,
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: screenWidth,
                child: MovementItem(movements.movements![index])),
          );
        },
      );
  }
}
