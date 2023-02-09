import 'package:flutter/material.dart';
import 'package:pixel_app/widget/custom_image.dart';
import 'package:pixel_app/widget/round_network_image.dart';

import '../model/user.dart';

class ProfileSettingsHeader extends StatelessWidget {
  final User user;

  const ProfileSettingsHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios))),
              const Expanded(flex: 3, child: Text('')),
              const Expanded(flex: 1, child: Icon(Icons.settings))
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: RoundNetworkImage(imageUrl: user.avatar!, radius: 57)),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              user.name!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(user.username!))
        ],
      ),
    );
  }
}
