import 'package:flutter/material.dart';

class SnapHeader extends StatelessWidget {
  String imageUrl;
  String name;
  String createdDate;
  String createdTime;

  SnapHeader(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.createdDate,
      required this.createdTime});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Image.asset(imageUrl),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(createdDate,
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 87, 87),
                                fontWeight: FontWeight.bold,
                                fontSize: 10)),
                      ),
                      Container(
                          child: Text(createdTime,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 87, 87, 87),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10)))
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: Icon(Icons.download),
          ),
        ],
      ),
    );
  }
}
