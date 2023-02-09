import 'package:flutter/material.dart';

class InlineButton extends StatelessWidget {
  final String label;
  final String buttonText;
  final VoidCallback onPressed;
  const InlineButton({
    super.key,
    required this.label,
    required this.buttonText,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$label ",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
