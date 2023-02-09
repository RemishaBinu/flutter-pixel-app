import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final Function onLogout;
  const ProfileMenu({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.history,
                    color: Colors.blue,
                  )),
              Expanded(
                flex: 9,
                child: Text(
                  'My Posts',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  )),
              Expanded(
                flex: 9,
                child: Text(
                  'Address',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.phone_in_talk,
                    color: Colors.blue,
                  )),
              Expanded(
                flex: 9,
                child: Text(
                  'Contact Us',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.settings,
                    color: Colors.blue,
                  )),
              Expanded(
                flex: 9,
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          child: GestureDetector(
            onTap: () => onLogout(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.logout,
                      color: Colors.blue,
                    )),
                Expanded(
                  flex: 9,
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(flex: 1, child: Text(' '))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
