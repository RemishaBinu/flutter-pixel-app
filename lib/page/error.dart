import 'package:flutter/material.dart';
import 'package:pixel_app/widget/primary_button.dart';

import '../routes.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/oo.png"),
          Column(
            children: [
              Text(
                'Oops',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                'Something went wrong',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          PrimaryButton(text: 'Back', onPressed: (() {}))
        ],
      ),
    )));
  }
}
