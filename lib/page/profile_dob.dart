import 'package:flutter/material.dart';
import 'package:pixel_app/widget/header_bold.dart';

import '../routes.dart';
import '../widget/date_picker.dart';
import '../widget/header_component.dart';
import '../widget/primary_button.dart';

class ProfileDob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/round.png"),
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomLeft)),
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LinearProgressIndicator(
                      value: 0.66,
                      backgroundColor: Color.fromARGB(255, 233, 233, 233),
                    ),
                    Container(
                      width: double.infinity,
                      child: HeaderBold(
                        upperText: 'Complete Profile',
                        lowerBoldText: 'Wish you birthday on',
                      ),
                    ),
                    Date(),
                    PrimaryButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/${Routes.profilePic.name}');
                        },
                        text: 'Next'),
                  ]),
            )));
  }
}
