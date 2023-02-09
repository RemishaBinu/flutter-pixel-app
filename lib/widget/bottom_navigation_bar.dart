import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.blue,
          ),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.cloud_upload,
            color: Color.fromARGB(255, 151, 200, 241),
          ),
          label: 'Likes',
          //   backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.download,
            color: Color.fromARGB(255, 151, 200, 241),
          ),
          label: 'Downloads',
          //  backgroundColor: Colors.green,
        ),
      ],
    );
  }
}
