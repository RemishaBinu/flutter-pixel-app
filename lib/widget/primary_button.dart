import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final int? fontSize;
  final int? height;
  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.fontSize,
    this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 20),
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            textStyle: const TextStyle(fontSize: 19)),
        child: Text(text));
  }
}
