import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void hideKeyboard([BuildContext? context]) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  if (context != null) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }
}
