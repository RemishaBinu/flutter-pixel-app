import 'package:flutter/material.dart';
import 'package:pixel_app/widget/primary_button.dart';
import '../routes.dart';

class CreateSnap extends StatelessWidget {
  const CreateSnap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: const Text(
            "Share your snaps with us",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.camera_alt_outlined),
              hintText: "Tap to upload your image",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Add upto four tags  Eg. Mountains",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              const Expanded(flex: 2, child: Text('')),
              Expanded(
                flex: 1,
                child: PrimaryButton(
                    text: 'Submit',
                    onPressed: (() {
                      Navigator.pushNamed(context, '/${Routes.product.name}');
                    })),
              ),
            ],
          ),
        )
      ],
    );
  }
}
