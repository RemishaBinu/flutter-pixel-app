import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final Function(String value)? onChange;
  Search({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: const InputDecoration(
          hintStyle: TextStyle(fontSize: 17),
          hintText: 'Search',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        onChanged: onChange,
      ),
    );
  }
}
