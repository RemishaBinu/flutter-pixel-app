import 'package:flutter/src/widgets/editable_text.dart';
import 'package:pixel_app/abstractions/ivalidator.dart';

class NameValidator extends IValidator{
  @override
  String? onValidate(TextEditingController controller) {
    var text = controller.text.trim();
    if(text==null || text.length<1){
      return 'name required';
    }
    return null;
  }
  
}