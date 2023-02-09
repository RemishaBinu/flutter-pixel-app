import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String upperText;
  final String? lowerText;
 // final String? lowerBoldText;
  const Header({
    super.key,
    required this.upperText,
    this.lowerText,
    //this.lowerBoldText
    
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            upperText,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            lowerText!,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(5),
        //   child: Text(
        //     lowerBoldText!,
        //     style: TextStyle(
        //       fontSize: 18,
        //       fontWeight: FontWeight.bold
        //     ),
        //   ),
        // )
      ],
    );
  }
}
