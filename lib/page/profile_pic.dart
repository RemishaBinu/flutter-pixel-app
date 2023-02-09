import 'package:flutter/material.dart';
import 'package:pixel_app/widget/header_bold.dart';
import '../routes.dart';
import '../widget/primary_button.dart';

class ProfilePic extends StatelessWidget {
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
                      value: 1,
                      backgroundColor: Color.fromARGB(255, 233, 233, 233),
                    ),
                    Container(
                      width: double.infinity,
                      child: HeaderBold(
                        upperText: 'Complete Profile',
                        lowerBoldText: 'Upload profile pic',
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 138,
                          height: 138,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Color.fromARGB(255, 234, 234,234),
                           )
                          
                        ),
                        Container(
                         child:  Image.asset("assets/images/cam.png",
                        alignment: const Alignment(1,1),),
                          width: 138,
                          height: 138,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            
                           )
                          
                        ),
                      
                      ],
                    ),
                    PrimaryButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/${Routes.home.name}');
                        },
                        text: 'Next'),
                  ]),
            )));
  }
}
