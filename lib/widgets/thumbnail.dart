import 'package:awesomemusic/helper/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 3),
            blurRadius: 5.0,
            spreadRadius: 0.2,
            color: kSecondaryColor.withOpacity(0.8),
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            image.replaceAll('http:', 'https:'),
          ),
        ),
      ),
    );
  }
}
