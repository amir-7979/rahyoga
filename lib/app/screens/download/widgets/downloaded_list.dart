import 'package:flutter/material.dart';

import 'downloaded_item.dart';

class DownloadedList extends StatelessWidget {

  DownloadedList(this.movies);
  List<Map<String, dynamic>> movies;

  @override
  Widget build (BuildContext context) {
    return movies.isEmpty ?  Container() : Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (BuildContext ctx, index) {
          return DownloadedItem(movies[index], index);
        },
      ),
    );
  }


}
