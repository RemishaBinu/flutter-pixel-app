import 'package:flutter/material.dart';

class HeaderBold extends StatelessWidget {
  final String upperText;

  final String? lowerBoldText;
  const HeaderBold({super.key, required this.upperText, this.lowerBoldText});
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
          padding: EdgeInsets.all(5),
          child: Text(
            lowerBoldText!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
