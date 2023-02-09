import 'package:flutter/material.dart';

import '../abstractions/ivalidator.dart';

class PriceValidator extends IValidator{
  @override
  String? onValidate(TextEditingController controller) {
    var text = controller.text.trim();
    if(text==null || text.length<1){
      return 'product price required';
    }
    return null;
  }
  
}