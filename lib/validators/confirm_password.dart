import 'package:flutter/src/widgets/editable_text.dart';
import 'package:pixel_app/abstractions/ivalidator.dart';
import 'package:pixel_app/validators/password_validator.dart';

class ConfirmPasswordValidator extends PasswordValidator{
  final TextEditingController passwordController;
  ConfirmPasswordValidator({required this.passwordController});
  @override
  String? onValidate(TextEditingController controller) {
   String? text = controller.text;
   String? errorText = validatePassword(text);
   if(errorText!=null){
    return errorText;
   }
   if(text!=passwordController.text){
    return 'Password mismatch';
   }
   return null;
  }
  
}