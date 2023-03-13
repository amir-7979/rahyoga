import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rahyoga/core/values/consts.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({required this.url, this.imageBuilder, Key? key})
      : super(key: key);
  final String url;
  final bool? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$baseUrl$url',
      //imageUrl: url,
      imageBuilder: imageBuilder == null
          ? null
          : imageBuilder == true
              ? (context, imageProvider) => Container(
                    width: 72.0,
                    height: 72.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  )
              : null,
      errorWidget: (context, url, error) => Image.network('${baseUrl}default_image.jpg'),
      fit: BoxFit.fill,
    );
  }
}
