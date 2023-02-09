import 'package:flutter/material.dart';

class SnapComment extends StatelessWidget {
  int? commentCount;
  SnapComment({super.key, this.commentCount});
 



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              child: Icon(
            Icons.message_rounded,
            color: Colors.grey,
          )),
          Container(
            margin: EdgeInsets.only(top: 10),
            child:Text(
             '$commentCount',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
