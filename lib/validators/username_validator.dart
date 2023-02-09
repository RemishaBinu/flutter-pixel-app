import 'package:flutter/src/widgets/editable_text.dart';
import 'package:pixel_app/abstractions/ivalidator.dart';

class UsernameValidator extends IValidator{
  @override
  String? onValidate(TextEditingController controller) {
    var text = controller.text.trim();
    if(text==null || text.length<1 ){
      return 'Username required';
    }
    if(text.length>70){
      return 'Username should have less than 70 characters';
    }
    return null;
  }
  
}