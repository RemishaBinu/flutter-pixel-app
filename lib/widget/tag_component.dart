import 'package:flutter/material.dart';

class TagComponent extends StatefulWidget {
  List<String>? tags;
  TagComponent({super.key, required this.tags});
  @override
  State<TagComponent> createState() {
    return TagComponentState();
  }
}

class TagComponentState extends State<TagComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Text(
                widget.tags![0],
                style: TextStyle(
                    color: Color.fromARGB(255, 74, 115, 235), fontSize: 18),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              widget.tags![1],
              style: TextStyle(
                  color: Color.fromARGB(255, 74, 115, 235), fontSize: 18),
              textAlign: TextAlign.start,
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          width: double.infinity,
          child: Text(
            widget.tags![2],
            style:
                TextStyle(color: Color.fromARGB(255, 74, 115, 235), fontSize: 18),
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
