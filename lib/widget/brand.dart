import 'package:flutter/material.dart';

class Brand extends StatelessWidget{
  String color;
  Brand({required this.color});
  String getImage(){
    return color == 'primary'
      ? "assets/images/log.png"
      : "assets/images/lo.png";
  }
  @override
  Widget build(BuildContext context) {
    return Image.asset(getImage());
  }

}