import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: InkWell(
                
                child: Text('Back',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,),
                
                onTap: () {
                   Navigator.pop(context);
                },
              ),
            ),
             Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
               child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          textAlign: TextAlign.start),
             )
          ],
        ),
      ),
     
    );
  }
}
