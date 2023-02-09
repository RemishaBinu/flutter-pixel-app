import 'package:flutter/material.dart';


class ProfileConfirm extends StatelessWidget {
  // Future<void> waitPrint() async {
  // await Future.delayed(const Duration(seconds: 5));
  // print("printed");
  // var printFuture = waitPrint();
  // await printFuture.timeout(const Duration(seconds: 2), onTimeout: () {
  //   print("timeout");
  // });
//}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/done.png'),
          ),
        )
        
            );
  }
}
