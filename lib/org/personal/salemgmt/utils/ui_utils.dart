import 'package:flutter/material.dart';

class UiUtils {
  static void showSnackBar(globalKey, String message, Color color) {
    final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: Duration(seconds: 5));
    globalKey.currentState.showSnackBar(snackBar);
  }
}
