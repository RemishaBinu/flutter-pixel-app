import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/ilocalstorage_service.dart';
import 'package:pixel_app/constants/string_constants.dart';
import 'package:pixel_app/providers/user_session.dart';
import 'package:pixel_app/routes.dart';
import 'package:pixel_app/service/local_notification_progress_service.dart';
import 'package:pixel_app/widget/brand.dart';
import 'package:pixel_app/widget/primary_button.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatelessWidget {
  final ILocalStorage localStorage;
  const GetStarted({super.key, required this.localStorage});

 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/round.png"),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomLeft)),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/pic.png",
                    fit: BoxFit.scaleDown,
                  ),
                  Brand(color: 'primary'),
                  const Text(
                    StringConstants.getStartedText,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  PrimaryButton(
                    text: "Get started",
                    onPressed:(() async {
                      // var instance = LocalNotificationProgressService
                      //   .getInstance();
                      //   instance.onStart("Uploadig file");
                      //   int prg = 0;
                      //   Timer.periodic(Duration(milliseconds: 100), (timer) {
                      //     prg++;
                      //     if(prg > 100){
                      //       instance.onFinished();
                      //       timer.cancel();
                      //       return;
                      //     }
                      //     instance.onProgress("Uploading file", prg);

                      //   });
                      // check if already logged in
                      bool isLoggedIn = Provider.of<UserSession>(context, listen: false)
                        .isLoggedIn();
                      if(isLoggedIn){
                        Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                            '/${Routes.home.name}',
                            (Route<dynamic> route) => false
                          );
                        return;
                      }
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                            '/${Routes.login.name}',
                            (Route<dynamic> route) => false
                          );
                    }  
                  ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
