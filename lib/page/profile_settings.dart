import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/ilocalstorage_service.dart';
import 'package:pixel_app/providers/user_session.dart';
import 'package:pixel_app/routes.dart';
import 'package:pixel_app/widget/profile_settings_header.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../widget/profile_menu.dart';

class ProfileSettings extends StatefulWidget {
  final User currentUser;
  const ProfileSettings({super.key, required this.currentUser});

  @override
  State<ProfileSettings> createState() => ProfileSettingsState();
}

class ProfileSettingsState extends State<ProfileSettings> {
  @override
  void initState() {
    super.initState();
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  getCurrentUserProfileSettings() {
    if (widget.currentUser == null) {
      return const Text('Loading');
    }

    return ProfileSettingsHeader(user: widget.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
                color: Color.fromARGB(255, 229, 229, 229),
                child: getCurrentUserProfileSettings()),
            ProfileMenu(onLogout: () {
              Provider.of<UserSession>(context, listen: false)
                .removeSession()
                .then((_) {
                  showSnackBar(context, 'You have successfully logged out');
                  Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                      '/${Routes.login.name}',
                      (Route<dynamic> route) => false
                    );
                });
            })
          ],
        ),
      ),
    );
  }
}
