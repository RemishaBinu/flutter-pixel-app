import 'package:flutter/src/widgets/editable_text.dart';
import 'package:pixel_app/abstractions/ivalidator.dart';

class PasswordValidator extends IValidator {
  String? validatePassword(String? text){
    if (text == null || text.length < 1) {
      return 'Password is required';
    }
    bool validPassword =
   //     RegExp(r"^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[@|#|_])([^\s]){8,12}$")
    RegExp(r"^(?=.*[a-z])([^\s]){8,12}$")
            .hasMatch(text.toString());
    if (!validPassword) {
      return 'Password must contain 8-12 characters, a-z';
    }
    return null;
  }
  @override
  String? onValidate(TextEditingController controller) {
    var text = controller.text.trim();
    return validatePassword(text);

    //"^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[@|#|_])([^\s]){8,12}$"gm
    //8 to 12 characters
    //a-z, A-Z, 0-9, @ # _  allowed characters
    //atleast 1 digit (0-9), atleast one small letter, atleast one capital, atleast one special character
  }
}
