import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkableText extends StatelessWidget {
  final String label;
  final String terms;
  final String text;
  final String policy;
  final VoidCallback onPressed;
  const LinkableText(
      {super.key,
      required this.label,
      required this.terms,
      required this.text,
      required this.policy,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black),
          text: label),
      TextSpan(
        style: const TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        text: terms,
        recognizer:  TapGestureRecognizer()
          ..onTap = () {
            onPressed();
          },
      ),
      TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black),
          text: text),
      TextSpan(
        style: const TextStyle(
            fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
        text: policy,
        recognizer:  TapGestureRecognizer()
          ..onTap = () {
            onPressed();
          },
      ),
    ]));

    //  Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children:[
    //     Text(
    //       label,
    //       style: const TextStyle(
    //         fontSize: 12,
    //       ),
    //     ),
    //     InkWell(
    //       onTap: onPressed,
    //       child: Text(
    //         terms,
    //         style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //     Text(
    //       text,
    //       style: const TextStyle(
    //         fontSize: 12,
    //       ),
    //     ),
    //     InkWell(
    //       onTap: onPressed,
    //       child: Text(
    //         policy,
    //         style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    //       ),
    //     ),
    //   ],
    // );
  }
}
