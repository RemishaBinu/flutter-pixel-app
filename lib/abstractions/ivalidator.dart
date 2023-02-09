import 'package:flutter/cupertino.dart';

abstract class IValidator {
  String? errorText='';
  String? validate(TextEditingController controller) {
    errorText = onValidate(controller);
    return errorText;
  }

  bool valid() {
    return errorText == null;
  }

  String? onValidate(TextEditingController controller);
}
