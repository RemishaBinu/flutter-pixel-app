import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class RoundBaseImage extends StatelessWidget {
  final String imageUrl;
  final double? radius;
  const RoundBaseImage({super.key, required this.imageUrl, this.radius});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: getImage(imageUrl),
      radius: radius ?? 26
    );
  }

  ImageProvider getImage(String url);
}
