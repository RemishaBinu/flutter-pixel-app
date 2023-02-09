import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/ivalidator.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  bool? isPassword;
  final TextEditingController controller;
  final IValidator? validator;

  CustomTextField(
      {required this.label,
      this.isPassword,
      required this.controller,
      this.validator});

  @override
  State<CustomTextField> createState() {
    return CustomTextFieldState();
  }
}

class CustomTextFieldState extends State<CustomTextField> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 12),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              widget.label,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextField(
            controller: widget.controller,
            onChanged: (value) {
              if (widget.validator == null) {
                return;
              }
              setState(() {
                errorText = widget.validator!.validate(widget.controller);
              });
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 190, 190, 190))),
                errorText: errorText),
            obscureText: widget.isPassword ?? false,
          ),
        ],
      ),
    );
  }
}
