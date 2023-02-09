import 'package:flutter/material.dart';


class CustomImage extends StatelessWidget{
  String? imageUrl;
  CustomImage({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Image.network(imageUrl!));
  }

}