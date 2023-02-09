import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/iauth_service.dart';
import 'package:pixel_app/model/user.dart';
import 'package:pixel_app/routes.dart';
import 'package:pixel_app/validators/confirm_password.dart';
import 'package:pixel_app/validators/password_validator.dart';
import 'package:pixel_app/validators/username_validator.dart';
import 'package:pixel_app/validators/name_validator.dart';
import 'package:pixel_app/widget/custom_text_field.dart';
import 'package:pixel_app/widget/header_component.dart';
import 'package:pixel_app/widget/image_picker.dart';
import 'package:pixel_app/widget/inline_button.dart';
import 'package:pixel_app/widget/linkable_text.dart';
import 'package:pixel_app/widget/primary_button.dart';

import '../widget/password_text_field.dart';

class Signup extends StatelessWidget {
  final IAuthService authService;

  // controllers
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // validators
  final nameValidator = NameValidator();
  final usernameValidator = UsernameValidator();
  final passwordValidator = PasswordValidator();
  var confirmPasswordValidator;

  Signup({super.key, required this.authService}) {
    confirmPasswordValidator =
        ConfirmPasswordValidator(passwordController: passwordController);
  }

  bool isFormValid() {
    return nameValidator.valid() &&
        usernameValidator.valid() &&
        passwordValidator.valid() &&
        confirmPasswordValidator.valid();
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
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: double.infinity,
                    child: const Header(
                        upperText: 'Create account',
                        lowerText: 'Start exploring each pixels'),
                  ),
                  ImagePickerWidget(
                      title: 'Upload profile Image', onUploaded: (_) {}),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        label: "Your name",
                        controller: nameController,
                        validator: nameValidator,
                      ),
                      CustomTextField(
                        label: "Your username",
                        controller: usernameController,
                        validator: usernameValidator,
                      ),
                      PasswordTextField(
                        controller: passwordController,
                        label: "Your password",
                        isPassword: true,
                        validator: passwordValidator,
                      ),
                      PasswordTextField(
                        controller: confirmPasswordController,
                        label: "Confirm password",
                        isPassword: true,
                        validator: confirmPasswordValidator,
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
                        text: "Create account",
                        onPressed: (() {
                          if (!isFormValid()) {
                            showSnackBar(context, 'Try to fix all the fields');

                            return;
                          }
                          authService
                              .createUser(User.forCreate(
                                  nameController.text.trim(),
                                  usernameController.text.trim(),
                                  passwordController.text.trim(),
                                  "https://api.lorem.space/image/face?w=640&h=480&r=867"))
                              .then((User user) {
                            if (user.id! > 0) {
                              showSnackBar(context, 'Your account created');
                              Navigator.pushReplacementNamed(
                                  context, '/${Routes.login.name}');
                              return;
                            }
                            showSnackBar(context, 'Failed to create account');
                          }).catchError((error) {
                            showSnackBar(
                                context, 'Error: Failed to create account');
                          });
                        }),
                      )
                    ],
                  ),
                  InlineButton(
                    label: 'Already have account?',
                    buttonText: 'Sign in',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/${Routes.login.name}');
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
