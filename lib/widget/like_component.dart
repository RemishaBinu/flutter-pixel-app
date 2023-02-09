import 'package:flutter/material.dart';

class Like extends StatelessWidget{
  int? likeCount;
  Like({super.key, this.likeCount});
  @override
 


  @override
  Widget build(BuildContext context) {
  return   Container(
                  child: Column(
                    children: [
                      Container(
                          width: 230,
                          child: Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          '$likeCount',
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