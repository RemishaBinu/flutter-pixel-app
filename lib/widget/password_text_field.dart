import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/ivalidator.dart';

class PasswordTextField extends StatefulWidget {
  final String label;
  bool? isPassword;
  final TextEditingController controller;
  final IValidator? validator;
  PasswordTextField(
      {required this.label, this.isPassword, required this.controller,
      this.validator});
  @override
  State<PasswordTextField> createState() {
    return PasswordTextFieldState();
  }
}

class PasswordTextFieldState extends State<PasswordTextField> {
  String? errorText;
  late String password;
  String passwordVal = '';

  void setPasswordVal() {
    passwordVal = password;
  }

  @override
  Widget build(BuildContext context) {
    _togglePasswordView() {
      setState(() {
        this.widget.isPassword = !this.widget.isPassword!;
      });
    }

    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 12),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              this.widget.label,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: const BorderSide(
                      width: 2, color: Color.fromARGB(255, 190, 190, 190))),
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(this.widget.isPassword == true
                    ? Icons.visibility_off
                    : Icons.visibility),
              ),
              errorText: errorText
            ),
            obscureText: this.widget.isPassword ?? false,
            onChanged: ((value) {
              if(widget.validator ==null){
                return;
              }
              setState(() {
                errorText = widget.validator!.validate(widget.controller);
              });
            }),
          ),
        ],
      ),
    );
  }
}
