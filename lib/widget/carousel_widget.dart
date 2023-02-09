import 'package:flutter/cupertino.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class CarouselWidget extends StatelessWidget{



List<String> imageUrl;
CarouselWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
   return Container(
          child: CarouselSlider(
        options: CarouselOptions(),
        items: imageUrl
            .map((item) => Container(
                  child: Center(
                      child:
                          Image.network(item, fit: BoxFit.cover, width: 2000)),
                ))
            .toList(),
      )); 
  }

}