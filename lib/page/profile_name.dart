import 'package:flutter/material.dart';
import 'package:pixel_app/widget/header_bold.dart';

import '../routes.dart';
import '../widget/header_component.dart';
import '../widget/primary_button.dart';

class ProfileName extends StatelessWidget {
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
                      value: 0.33,
                      backgroundColor: Color.fromARGB(255, 233, 233, 233),
                    ),
                    Container(
                      width: double.infinity,
                      child: HeaderBold(
                        upperText: 'Complete Profile',
                        lowerBoldText: 'We would like to know your name',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 50),
                      child: Image.asset("assets/images/ac.png"),
                    ),
                    Container(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Your name',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 5,
                              color: Color.fromARGB(255, 190, 190, 190),
                            ),
                          ),
                        ),
                      ),
                    ),
                    PrimaryButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/${Routes.profileDob.name}');
                        },
                        text: 'Next')
                  ]),
            )));
  }
}
