import 'package:flutter/material.dart';

import '../widget/brand.dart';

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,0, 112, 193),
      body: Center(
       child: Brand(color:'white'),)
    );

  }

}