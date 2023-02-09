import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/iauth_service.dart';
import 'package:pixel_app/abstractions/ilocalstorage_service.dart';
import 'package:pixel_app/providers/user_session.dart';
import 'package:pixel_app/routes.dart';
import 'package:pixel_app/service/local_storage.dart';
import 'package:pixel_app/validators/username_validator.dart';
import 'package:pixel_app/validators/password_validator.dart';
import 'package:pixel_app/widget/custom_text_field.dart';
import 'package:pixel_app/widget/inline_button.dart';
import 'package:provider/provider.dart';
import '../widget/header_component.dart';
import '../widget/linkable_text.dart';
import '../widget/password_text_field.dart';
import '../widget/primary_button.dart';
import '../model/user.dart';

class Login extends StatelessWidget {
  final IAuthService authService;
  final ILocalStorage localStorage;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Login({super.key, required this.authService, required this.localStorage});

  final userNameValidator = UsernameValidator();
  final passwordValidator = PasswordValidator();

  bool isFormValid() {
    return userNameValidator.valid() && passwordValidator.valid();
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

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
            margin: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  child: const Header(
                      upperText: 'Login to account',
                      lowerText: 'Continue by login to your account'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                        label: "Your username",
                        controller: usernameController,
                        validator: userNameValidator),
                    PasswordTextField(
                      label: "Your password",
                      isPassword: true,
                      controller: passwordController,
                      validator: passwordValidator,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 5, bottom: 68),
                      child: LinkableText(
                        label: 'By signing up you are agree to pixel’s ',
                        terms: 'Terms of uses ',
                        text: 'and ',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/${Routes.policy.name}');
                        },
                        policy: 'Privacy policy',
                      ),
                    ),
                    PrimaryButton(
                      text: "Login",
                      onPressed: (() async {
                        if (!isFormValid()) {
                          showSnackBar(context, 'Try to fix all the fields');

                          return;
                        }
                        //   print(authService.login('username', 'password'));
                        await authService
                            .login(usernameController.text.trim(),
                                passwordController.text.trim())
                            .then((token) {
                          if (token.isNotEmpty) {
                            // start user session
                            Provider.of<UserSession>(context, listen: false)
                              .startSession(token)
                              .then((_) {
                                showSnackBar(
                                  context, 'You have successfully logged in');
                                Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                    '/${Routes.home.name}',
                                    (Route<dynamic> route) => false
                                  );
                              });
                            return;
                          }
                          else {
                            showSnackBar(context, 'Failed to logged in');
                          }
                        }).catchError((error) {
                          print(error);
                          showSnackBar(context, 'Error:  Failed to logged in');
                        });
                      }),
                    )
                  ],
                ),
                InlineButton(
                  label: 'Didn’t have account?',
                  buttonText: 'Sign up',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/${Routes.signup.name}');
                  },
                )
              ],
            ),
          )),
    );
  }
}
