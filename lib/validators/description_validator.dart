import 'package:flutter/material.dart';

import '../abstractions/ivalidator.dart';

class DescriptionValidator extends IValidator{
  @override
  String? onValidate(TextEditingController controller) {
    var text = controller.text.trim();
    if(text==null || text.length<1){
      return 'product description required';
    }
    return null;
  }
  
}