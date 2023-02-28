
import 'package:flutter/material.dart';

import 'blogs_item.dart';

class BlogList extends StatelessWidget {
   BlogList({Key? key}) : super(key: key);
  var items = [1,1,1,1,1,11,1];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
      child: ListView.separated(
        separatorBuilder: (BuildContext ctx, index) => const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
          child: Divider(height: 1),
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext ctx, index) {
          return  const BlogItem();

        },

      ),
    );
  }
}
