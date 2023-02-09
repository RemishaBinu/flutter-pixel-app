import 'package:flutter/cupertino.dart';

import '../abstractions/ivalidator.dart';

class TitleValidator extends IValidator{
  @override
  String? onValidate(TextEditingController controller) {
    var text = controller.text.trim();
    if(text==null || text.length<1){
      return 'product title required';
    }
    return null;
  }
  
}